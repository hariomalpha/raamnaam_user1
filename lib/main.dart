import 'package:flutter/material.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/Category/ScheduleDateScreen.dart';
import 'package:raamnaam/splash_screen.dart';

import 'View/AddToCart/BookingScreen.dart';
import 'View/AuthView/login.dart';
import 'View/Category/CaterCategory.dart';
import 'View/Category/MoreInfo.dart';
import 'View/Category/PurohitCategory.dart';
import 'View/Category/ScheduleDateScreen2.dart';
import 'View/Category/TentHouseCategory.dart';
import 'Home/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: CustomColors.primaryColor
        ),
        home:WillPopScope(
        onWillPop: () async {
          bool exit = (await _showExitConfirmationDialog(context)) as bool;
          return exit;
        },
            child: splashScreen())     //homeScreen()
    );
  }
  Future<Future<bool?>> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Exit Confirmation'),
          content: Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}





