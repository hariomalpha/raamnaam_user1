import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/AuthView/forget_password.dart';
import 'package:raamnaam/View/AuthView/signup.dart';
import 'package:raamnaam/View/AuthView/verify_otp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/apiBasehelper.dart';
import '../../Helper/apiStrings.dart';
import '../../Home/homeScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  int _value = 1;
  bool isMobile = true;
  bool isLoading = false;
  var Otp;

  Future<void> loginWithEmail() async {
    var headers = {
      'Cookie': 'ci_session=6e34bdd97875ed796707c02295da6acd82c85782'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${loginWithMail}'));
    request.fields.addAll({
      'email': '${emailController.text}',
      'password': '${passwordController.text}'
    });
    print("login with email para ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("working@@@@@@@@@");
      var finalResponse = await response.stream.bytesToString();
      jsonResponse = json.decode(finalResponse);
      print("responseeee ${jsonResponse}");
      Fluttertoast.showToast(msg: jsonResponse!['message']);

      if (jsonResponse!['status'] == true) {
         final SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setString('userId', jsonResponse!['data']["id"]);
        prefs.setBool("isLogIn", true);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homeScreen()));
      }
    } else {
      Fluttertoast.showToast(msg: jsonResponse!['message']);
    }
  }

  Map? jsonResponse;
  Future<void> loginWithMobile() async {
    var headers = {
      'Cookie': 'ci_session=dd06823d744e84ad73a327e309c6f7b3575fc5b2'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${loginMobile}'));
    request.fields
        .addAll({'login_mobile': '${mobileController.text}', 'check': '2'});
    print("login with mobile para ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("working---------");
      var finalResponse = await response.stream.bytesToString();
      jsonResponse = json.decode(finalResponse);
      print("responseeee ${jsonResponse}");
      Otp = (jsonResponse!['otp']);

      // Fluttertoast.showToast(msg: jsonResponse!['message']);
      if (jsonResponse!['status'] == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyOtp(
                      mobile: mobileController.text,
                      otp: Otp,
                    )));
        Fluttertoast.showToast(msg: jsonResponse!['message']);
      } else {
        Fluttertoast.showToast(msg: jsonResponse!['message']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      'assets/logo/login logo.png',
                      // 'assets/images/login_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: const BoxDecoration(
                        color: CustomColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 1,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => CustomColors.whiteColor),
                                groupValue: _value,
                                onChanged: (int? value) {
                                  setState(() {
                                    _value = value!;
                                    isMobile = true;
                                  });
                                }),
                            // SizedBox(width: 10.0,),
                            const Text(
                              "Mobile No.",
                              style: TextStyle(
                                  color: CustomColors.whiteColor, fontSize: 18),
                            ),
                            Radio(
                              value: 2,
                              fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                              activeColor: Colors.white,
                              groupValue: _value,
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value!;
                                  isMobile = false;
                                });
                              },
                            ),
                            const Text(
                              "Email",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                        !isMobile
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20, left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        //Theme.of(context).colorScheme.gray,
                                      ),
                                      child: Center(
                                        child: TextFormField(
                                          controller: emailController,
                                          //validator: FormValidation.emailVeledetion,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                !RegExp(r'^[a-z||A-Z||0-9]+@[a-z]+\.[a-z]{2,3}')
                                                    .hasMatch(value)) {
                                              return 'This value is required';
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          // maxLength: 10,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            counterText: "",
                                            contentPadding: EdgeInsets.only(
                                                left: 15, top: 15),
                                            hintText: "Enter Email",
                                            hintStyle: TextStyle(
                                                color: CustomColors.blackTemp),
                                            // labelText: "Enter Email id",
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color:
                                                  CustomColors.secondaryColor,
                                              size: 24,
                                            ),
                                            // border: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.circular(10),
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: CustomColors.whiteColor,
                                      ),
                                      child: Center(
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.length != 8) {
                                              return 'This value is required';
                                            }
                                            return null;
                                          },
                                          inputFormatters: <TextInputFormatter>[
                                            LengthLimitingTextInputFormatter(8),
                                            // FilteringTextInputFormatter.allow(
                                            // //  RegExp(r'[0-8]'),
                                            // ),
                                            // FilteringTextInputFormatter.digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            counterText: "",
                                            contentPadding: EdgeInsets.only(
                                                left: 15, top: 15),
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: CustomColors.blackTemp),
                                            // labelText: "Pass",
                                            prefixIcon: Icon(Icons.lock,
                                                color: CustomColors
                                                    .secondaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgetPassword()));
                                        },
                                        child:  Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Forgot Password?",
                                              style: TextStyle(
                                                  color:
                                                      CustomColors.whiteColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50.0,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (emailController.text.isEmpty ||
                                              passwordController.text.isEmpty) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Enter Email and Password');
                                          } else {
                                            loginWithEmail();
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Please fill all fields");
                                        }
                                      },
                                      child: Container(
                                        height: 43,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: CustomColors.secondaryColor),
                                        child:
                                            // isLoading ?
                                            // loadingWidget():
                                            const Center(
                                                child: Text("Sign In",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black))),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                        isMobile
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    //Theme.of(context).colorScheme.gray,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: mobileController,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 10) {
                                          return 'This value is required';
                                        }
                                        return null;
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        LengthLimitingTextInputFormatter(10),
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'),
                                        ),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding:
                                            EdgeInsets.only(left: 15, top: 15),
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                            color: CustomColors.blackTemp),
                                        prefixIcon: Icon(
                                          Icons.call,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        isMobile
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 80, left: 20, right: 20),
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   const SnackBar(
                                      //       content: Text('Processing Data')),
                                      //  );
                                      loginWithMobile();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyOtp()));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Please enter Valid mobile no.');
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyOtp()));
                                  },
                                  child: Container(
                                      height: 43,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: CustomColors.secondaryColor),
                                      child: const Center(
                                          child: Text("Send OTP",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black)))),
                                ),
                              )
                            : SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: CustomColors.whiteColor,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              //   onTap: (){},
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: CustomColors.whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()
                                      //     VendorRegisteration(
                                      //   role: "0",
                                      // ),
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
