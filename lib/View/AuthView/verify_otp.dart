

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/Home/homeScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/apiStrings.dart';

class VerifyOtp extends StatefulWidget {
  var otp;
  String? mobile;
  VerifyOtp({this.otp, this.mobile});

  // final otp, email;
  //  final bool signUp;
  //  VerifyOtp({Key? key, this.otp, this.email, required this.signUp}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  var apiOtp;
  var inputOtp;
  // ProgressDialog? pr;

  // final pinController = OTPTextField();
  OtpFieldController otpController = OtpFieldController();

  final focusNode = FocusNode();


  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Map? jsonResponse;

  var PIN;
  setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogIn", true);
  }

  @override
  Widget build(BuildContext context) {

    Future<void> verifyOTP() async {
      var headers = {
        'Cookie': 'ci_session=6e34bdd97875ed796707c02295da6acd82c85782'
      };
      var request = http.MultipartRequest('POST', Uri.parse('${verifyOtp}'));
      request.fields.addAll({
        'mobile': '${widget.mobile}',
        'otp': '${PIN}'
      });
      print("verify otp param ${request.fields}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print('my status code--------------${response.statusCode}');
      if (response.statusCode == 200) {
        print("${PIN}=========================");
        print("working@@@@@@@@@");
        var finalResponse = await response.stream.bytesToString();
        jsonResponse = json.decode(finalResponse);
        print("responseeee ${jsonResponse}");
      //  Fluttertoast.showToast(msg: jsonResponse!['message']);

        if(jsonResponse!['status']=="success")
        {
          setLogin();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homeScreen()));
          Fluttertoast.showToast(msg: jsonResponse!['message']);
        }else {
          Fluttertoast.showToast(msg: jsonResponse!['message']);
        }

      } else {
        Fluttertoast.showToast(msg: jsonResponse!['message']);
      }
    }




    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:CustomColors.primaryColor,
        leading:   InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 25, top: 5),
              child: Icon(Icons.arrow_back_ios,color:Colors.white),
            )),
        title: const Text("Verification", style: TextStyle(fontSize: 20,color: CustomColors.whiteColor),),
        centerTitle: true,
      ),

      backgroundColor:CustomColors.primaryColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
           const  SizedBox(height: 50,),
            const Text(
              "Code has sent to",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            const SizedBox(height: 9,),
            Text(
              "+91${widget.mobile}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),

            const SizedBox(height: 10,),
            Text(
              "${widget.otp}",

              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                color: Colors.white,
              ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20),
              child: OTPTextField(
                controller: otpController,
                length:4,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.white,
                  disabledBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                style: const TextStyle(
                    fontSize: 17,
                  color: Colors.white
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  PIN=pin;
                  print("Completed: " + pin);
                },
              ),
            ),

            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Haven't received the verification code? ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  // textAlign: TextAlign.center,
                ),
                // Text("${widget.otp}")
                TextButton(
                  onPressed: (){
                    // loginWithOtp();
                    verifyOTP();
                  },
                  child: const Text(
                    "Resend",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child:
                InkWell(
                    onTap: (){
print(widget.mobile);
print(widget.otp);
                      if (_formKey.currentState!.validate()) {
                        verifyOTP();
                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>homeScreen()));
                      } else {
                        // setState((){
                        //   isLoading =false;
                        // });
                       //Fluttertoast.showToast(msg: "Pls Enter Otp!");
                      }
                    },
                  child: Container(
                      height: 43,
                      width:  MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color:CustomColors.secondaryColor),
                      child:
                      // isLoading ?
                      //                       // loadingWidget()
                      //                       //     :
                      const Center(child: Text("Verify Authentication Code", style: TextStyle(fontSize: 18, color:Colors.black))
                  ),
                )
            ), ),
          ],
        ),
      ),
    );
  }

}

