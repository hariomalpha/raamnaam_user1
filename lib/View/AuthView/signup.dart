import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/apiStrings.dart';
import '../../Utils/colors.dart';
import 'package:http/http.dart' as http;
import '../../Home/homeScreen.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController refController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final mobileController = TextEditingController();
  final codeController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? password, email, userid, message, userTocken, responseCode;
  // late int? otp;

  Map? jsonResponse;
  int _value = 1;
  bool isMobile = false;
  bool isSendOtp = false;
  num? otp;
  bool isLoading = false;

  Future<void> registerUser() async{
    var headers = {
      'Cookie': 'ci_session=72d6bc9ad41f014356d203e2b4ba199c4f86afd8'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${getUserRegister}'));
    request.fields.addAll({
      'userName': '${nameController.text}',
      'userEmail': '${emailController.text}',
      'userMobile': '${mobileController.text}',
      'password': '${passwordController.text}',
      'confirm_password': '${confirmController.text}'
    });
    print("parameter hererer ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("working@@@@@@@@@");
      var finalResponse = await response.stream.bytesToString();
      jsonResponse = json.decode(finalResponse);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogIn", true);
      print("responseeee ${jsonResponse}");
      Fluttertoast.showToast(msg: jsonResponse!['message']);
      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
    }
    else {
      Fluttertoast.showToast(msg: jsonResponse!['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
          onWillPop:() async {
            SystemNavigator.pop();
            return true;
          },
          child:
          SafeArea(
            top: true,
            bottom: false,
            child: Scaffold(
              backgroundColor:CustomColors.primaryColor,
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   // height: MediaQuery.of(context).size.height,
                    //   child: Image.asset(
                    //     'assets/logo/app icon.png',height: 150,width: 150,
                    //     // 'assets/images/login_logo.png',
                    //
                    //   ),
                    // ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            "Please provide your basic information in order to book and avail services",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 0, left: 20, right: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:CustomColors.whiteColor,
                                    //Theme.of(context).colorScheme.gray,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: nameController,
                                      validator: (msg) {
                                        if (msg!.isEmpty) {
                                          return "Please Enter your name!";
                                        }
                                      },
                                      // validator: FormValidation.emailVeledetion,
                                      keyboardType:
                                      TextInputType.text,
                                      // maxLength: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Enter Name",hintStyle: TextStyle(color:CustomColors.blackTemp),
                                        // labelText: "Enter Email id",
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color:CustomColors.secondaryColor,
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
                                    color:CustomColors.whiteColor,
                                    //Theme.of(context).colorScheme.gray,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: mobileController,
                                       validator: (value) {
                                        if (value== null ||
                                            value.isEmpty ||
                                            value.length < 10) {
                                          return 'please enter mobile number';
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
                                      // validator: FormValidation.emailVeledetion,
                                      keyboardType:
                                      TextInputType.number,
                                      maxLength: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Mobile",hintStyle: TextStyle(color:CustomColors.blackTemp),
                                        // labelText: "Enter Email id",
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color:CustomColors.secondaryColor,
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
                                  height: 20.0,
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:CustomColors.whiteColor,
                                    //Theme.of(context).colorScheme.gray,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: emailController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ){
                                          return 'please enter email';
                                        }
                                         else if ( !RegExp(r'^[a-z||A-Z||0-9]+@[a-z]+\.[a-z]{2,3}')
                                                .hasMatch(value)) {
                                          return 'invalid email';
                                        }
                                        return null;
                                      },
                                      // validator: FormValidation.emailVeledetion,
                                      keyboardType:
                                      TextInputType.emailAddress,
                                      // maxLength: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Enter Email",hintStyle: TextStyle(color:CustomColors.blackTemp),
                                        // labelText: "Enter Email id",
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: CustomColors.secondaryColor,
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
                                  height: 20.0,
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:CustomColors.whiteColor,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText:  true,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ) {
                                          return 'please enter password';
                                        }
                                        else if(value.length < 8){
                                          return 'weak password!!, at least 8 character required';
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
                                      // maxLength: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Password",hintStyle: TextStyle(color:CustomColors.blackTemp),
                                        // labelText: "Pass",
                                        prefixIcon: Icon(Icons.lock,color: CustomColors.secondaryColor,),
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:CustomColors.whiteColor,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: confirmController,
                                      obscureText:  false ,
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if ((value == null ||
                                            value.isEmpty) && passwordController.text.isNotEmpty ) {
                                          return "please confirm password";
                                        }
                                        else if(value != passwordController.text){
                                          return 'password not matched';
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
                                      // maxLength: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Confirm Password",hintStyle: TextStyle(color:CustomColors.blackTemp),
                                        // labelText: "Pass",
                                        prefixIcon: Icon(Icons.lock,color: CustomColors.secondaryColor,),
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
                                    color:CustomColors.whiteColor,
                                    //Theme.of(context).colorScheme.gray,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: refController,
                                      keyboardType:
                                      TextInputType.text,
                                      // maxLength: 10,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Referral Code (Optional)",hintStyle: TextStyle(color:CustomColors.blackTemp),
                                        // labelText: "Enter Email id",
                                        prefixIcon: Icon(
                                          Icons.cached_outlined,
                                          color: CustomColors.secondaryColor,
                                          size: 24,
                                        ),
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
                          child:
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLoading = true;
                              });
                              if(_formKey.currentState!.validate()){
                                // sendOtp();
                                if(passwordController.text != confirmController.text){
                                  Fluttertoast.showToast(msg: "Password must be same");
                                }else
                                  {
                                    registerUser();
                                  }
                                // registerUser();
                              }else{
                                setState((){
                                  isLoading = false;
                                });
                                // Fluttertoast.showToast(msg: "All Fields Are Required!");
                              }
                            },
                            child: Container(
                                height: 43,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color:CustomColors.secondaryColor),
                                child:
                                // isLoading ?
                                // loadingWidget():
                                const Center(child: Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.black)))
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color:CustomColors.whiteColor,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              //   onTap: (){},
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                    color:CustomColors.whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()
                                    //     VendorRegisteration(
                                    //   role: "0",
                                    // ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          )
      );
  }
}
