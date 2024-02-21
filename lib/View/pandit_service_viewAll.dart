import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raamnaam/Model/service_model.dart';
import '../Utils/colors.dart';
import 'package:http/http.dart 'as http;

class PanditServiceView extends StatefulWidget {
  const PanditServiceView({Key? key}) : super(key: key);

  @override
  State<PanditServiceView> createState() => _PanditServiceViewState();
}

class _PanditServiceViewState extends State<PanditServiceView> {



  showAlert(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.only(top:200.0,bottom:100),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Home Services',style: TextStyle(fontSize:20,fontWeight: FontWeight.w700,color:CustomColors.blackTemp),),
                    SizedBox(height: 10,),
                    CarouselSlider(
                        items: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(height: 90,width: 350,
                              decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
                                  fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(height: 70,width: 350,
                              decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
                                  fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(height: 70,width: 350,
                              decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
                                  fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Container(height: 80,width: 350,
                              decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
                                  fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(height: 70,width: 350,
                              decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
                                  fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Container(height: 70,width: 370,
                              decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
                                  fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),),
                          )
                        ], options:CarouselOptions(height: 190,autoPlay: true)),
                    Positioned(
                      bottom: 0,
                      height: 40,
                      left: 0,
                      width: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                            Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 2.0),
                                decoration: BoxDecoration(
                                  color:CustomColors.primaryColor,
                                  shape: BoxShape.circle,
                                )),
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 2.0),
                              decoration: const BoxDecoration(
                                color:CustomColors.primaryColor,
                                shape: BoxShape.circle,
                              )),
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 2.0),
                              decoration: const BoxDecoration(
                                color:CustomColors.primaryColor,
                                shape: BoxShape.circle,
                              )),
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 2.0),
                              decoration: const BoxDecoration(
                                color:CustomColors.primaryColor,
                                shape: BoxShape.circle,
                              )),
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 2.0),
                              decoration: const BoxDecoration(
                                color:CustomColors.primaryColor,
                                shape: BoxShape.circle,
                              ))
                          ]
                        ),
                      ),
                  ],
                ),
              ),
            );
          },);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    final widthSize =MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        leading: GestureDetector(
            onTap: () {
             Navigator.pop(context);
            },
            child:Icon(Icons.arrow_back,color: CustomColors.whiteColor,)),
        title: Row(
            children:const <Widget>[
              Icon(Icons.location_on_outlined,color: CustomColors.whiteColor,),
              Text('Indore,Vijay Nagar Indore',overflow: TextOverflow.ellipsis,)
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget>[
            SizedBox(height: 40,),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:40.0,bottom: 5),
                      child: Image.asset('assets/logo/logo.png',height: 90,width: 100,),
                    ),
                    SizedBox(width: 60,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.shopping_cart,color:CustomColors.secondaryColor,size:30,),
                        SizedBox(width: 10,),
                        Text('Cart',style: TextStyle(color:CustomColors.secondaryColor,fontSize:15),)
                      ],
                    ),
                    SizedBox(width: 30,),
                    Padding(
                      padding: const EdgeInsets.only(right:35.0,bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.shopping_cart_checkout_rounded,color:CustomColors.secondaryColor,size:30,),
                          SizedBox(width: 10,),
                          Text('Service',style: TextStyle(color:CustomColors.secondaryColor,fontSize:15),)
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top:6,
                  left:230,
                  child: Container(
                    height:25,
                    width: 25,
                    decoration:BoxDecoration(
                        color:CustomColors.primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(child: Text('0',style: TextStyle(color: CustomColors.whiteColor),)),
                  ),
                ),
                Positioned(
                  top:6,
                  left:300,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration:BoxDecoration(
                        color:CustomColors.primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(child: Text('0',style: TextStyle(color: CustomColors.whiteColor),)),
                  ),
                ),
              ],
            ),
            SizedBox(height:20,),
            SizedBox(
              width: widthSize/1.1,
              height: 47,
              child: TextFormField(
                decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    hintText:'What are you looking for?',
                    suffixIcon: Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            color: CustomColors.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.search,color: CustomColors.whiteColor,size:40,))
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(height: 80,
            width: widthSize/1,
              color:CustomColors.lightSky,
              child: Center(child: Text('Pandit Ji',style: TextStyle(color: CustomColors.blackTemp,fontSize: 30),)),
            ),
            SizedBox(height: 20,),
            Container(
              height: 70,
              width: widthSize/1.1,
              decoration: BoxDecoration(border: Border.all(color: CustomColors.whiteColor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Service Categories',style:TextStyle(color:CustomColors.secondaryColor,fontSize: 20,fontWeight: FontWeight.w500)),
                  Text('Looking for a service? Find your Service here :',style: TextStyle(color:CustomColors.blackTemp,fontWeight: FontWeight.w500,fontSize:16),)
                ],
              ),
            ),
            Text('5 Services',style: TextStyle(fontSize:30,),),
            SizedBox(height: 10,),
            Column(
              children: [
                SizedBox(
                  height: heightSize/3,
                  child: GestureDetector(
                    onTap: () {
                      showAlert();
                    },
                    child: Stack(
                      children: [
                        CarouselSlider(
                            items: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 90,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 80,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 100,width: 370,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
                                  fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              )
                            ], options:CarouselOptions(height: 160,autoPlay: true)),
                        Positioned(
                          top:130,
                          left:120,
                          right:120,
                          child: ElevatedButton(onPressed:(){},
                              style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                                  maximumSize:Size(90,50) ),
                              child:Center(child: Text('Homa',style: TextStyle(fontSize:11),))),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightSize/3,
                  child: GestureDetector(
                    onTap: () {
                      showAlert();
                    },
                    child: Stack(
                      children: [
                        CarouselSlider(
                            items: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 90,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 80,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 100,width: 370,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              )
                            ], options:CarouselOptions(height: 160,autoPlay: true)),
                        Positioned(
                          top:130,
                          left:120,
                          right:120,
                          child: ElevatedButton(onPressed:(){},
                              style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                                  maximumSize:Size(90,50) ),
                              child:Center(child: Text('Sanskaras',style: TextStyle(fontSize:11),))),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightSize/3,
                  child: GestureDetector(
                    onTap: () {
                      showAlert();
                    },
                    child: Stack(
                      children: [
                        CarouselSlider(
                            items: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 90,width:300,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 80,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 100,width: 370,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              )
                            ], options:CarouselOptions(height: 160,autoPlay: true)),
                        Positioned(
                          top:130,
                          left:120,
                          right:120,
                          child: ElevatedButton(onPressed:(){},
                              style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                                  maximumSize:Size(90,50) ),
                              child:Center(child: Text('Ceremony',style: TextStyle(fontSize:11),))),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightSize/3,
                  child: GestureDetector(
                    onTap: () {
                      showAlert();
                    },
                    child: Stack(
                      children: [
                        CarouselSlider(
                            items: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 90,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 80,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 100,width: 370,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              )
                            ], options:CarouselOptions(height: 160,autoPlay: true)),
                        Positioned(
                          top:130,
                          left:120,
                          right:120,
                          child: ElevatedButton(onPressed:(){},
                              style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                                  maximumSize:Size(90,50) ),
                              child:Center(child: Text('Pooja',style: TextStyle(fontSize:11),))),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightSize/3,
                  child:GestureDetector(
                    onTap: () {
                      showAlert();
                    },
                    child: Stack(
                      children: [
                        CarouselSlider(
                            items: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 90,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 70,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 80,width: 350,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                child: Container(height: 100,width: 370,
                                  decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
                                      fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),),
                              )
                            ], options:CarouselOptions(height: 160,autoPlay: true)),
                        Positioned(
                          top:130,
                          left:120,
                          right:120,
                          child: ElevatedButton(onPressed:(){},
                              style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                                  maximumSize:Size(90,50) ),
                              child:Center(child: Text('Mutta Swamy Bhiksha',style: TextStyle(fontSize:11),))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height:heightSize/0.8,
              width:widthSize/1 ,
              color: CustomColors.lightSky,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/logo/logo.png',height: 120,width: 100,),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left:10.0,right: 10),
                    child: Text('Ramnaam is an e-nest offering you a pool of handpicked professional'
                        ' Ramnaam anywhere in the world! Finding local services just got easier,'
                        ' be it a photographer or a live band, at Ramnaam you can hire professionals '
                        'that are reliable no matter what your location is. '
                        'Take memories back with you when you travel with quality local services at Ramnaam!',
                      style: TextStyle(fontSize: 20,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Categories',style: TextStyle(
                        color:CustomColors.secondaryColor,fontWeight: FontWeight.w500,fontSize:30),),
                  ),
                  Row(children: [
                    Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Pandit Ji',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Photographer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Tent House',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Caters',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Grocery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
