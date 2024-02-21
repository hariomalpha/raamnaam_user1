import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

  AppBar customAppBar(title){
  return AppBar(
    elevation: 0,
    backgroundColor:CustomColors.primaryColor,
    title: Text(title!,
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),),
    centerTitle: true,
    // leading: IconButton(
    //   onPressed: (){
    //     Navigator.pop(context);
    //   },
    //   icon: const Icon(Icons.arrow_back_ios, color:CustomColors.whiteColor,),
    // ),
  );
}