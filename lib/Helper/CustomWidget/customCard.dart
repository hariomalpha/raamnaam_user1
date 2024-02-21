import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   String? title;
   String? subtitle;
   String? imageUrl;
   VoidCallback? onPressed;

  CustomCard(Image image,);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:3,

    );
  }
}
