import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/AuthView/login.dart';
import 'package:raamnaam/Home/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   bool? isLogin = prefs.getBool('isLogIn');
    if(isLogin??false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homeScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
     Timer(const Duration(seconds: 3), () {
       checkLogin();
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
     body: SizedBox(
       height: MediaQuery.of(context).size.height/1,
       width: MediaQuery.of(context).size.width/1,
       child: Image.asset('assets/logo/splash screen.png'),
     ),
    );
  }
}
