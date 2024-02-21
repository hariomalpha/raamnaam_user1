import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final widthSize =MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text('Contact Us',),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget>[
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const Icon(Icons.email,color: CustomColors.primaryColor,size:40,),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Email Address',style: TextStyle(fontSize: 20,),),
                    const SizedBox(height: 8,),
                  Text('hello@gmail.com',style: TextStyle(fontSize:15,color: CustomColors.grayColor),)
                ],)
              ],),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.location_on_outlined,color: CustomColors.primaryColor,size:40,),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Our Location',style: TextStyle(fontSize: 20,),),
                    const SizedBox(height: 8,),
                    Text('Indore, MP',style: TextStyle(fontSize:15,color: CustomColors.grayColor),)
                  ],)
              ],),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.phone,color: CustomColors.primaryColor,size:40,),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact No.',style: TextStyle(fontSize: 20,),),
                    const SizedBox(height: 8,),
                    Text('9090909090',style: TextStyle(fontSize:15,color: CustomColors.grayColor),)
                  ],)
              ],),
            ),
           const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(16),
              color:CustomColors.lightgray,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text('Name',style: TextStyle(color: CustomColors.blackTemp,fontSize: 20),),
                  const SizedBox(height: 5,),
                  TextFormField(
                      decoration: InputDecoration(
                        fillColor: CustomColors.whiteColor,filled: true,
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  )),
                  const SizedBox(height: 10,),
                  const Text('Email',style: TextStyle(color: CustomColors.blackTemp,fontSize: 20),),
                  const SizedBox(height: 5,),
                  TextFormField(
                      decoration: InputDecoration(
                        fillColor: CustomColors.whiteColor,filled: true,
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  )),
                  const SizedBox(height: 10,),
                  const Text('Subject',style: TextStyle(color: CustomColors.blackTemp,fontSize: 20),),
                  const SizedBox(height: 5,),
                  TextFormField(decoration: InputDecoration(
                    fillColor: CustomColors.whiteColor,filled: true,
                    hintText: 'Enter Subject',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  )),
                  const SizedBox(height: 10,),
                  const Text('Messages',style: TextStyle(color: CustomColors.blackTemp,fontSize: 20),),
                  const SizedBox(height: 5,),
                  TextFormField(
                     maxLines: 3,
                      decoration:  InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    fillColor: CustomColors.whiteColor,filled: true,
                    hintText: 'Enter Message',
                  )),
                  const SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                        onPressed:(){},
                        style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                            maximumSize: const Size(120,45) ),
                        child:const Center(child: Text('Submit',style: TextStyle(fontSize:15),))),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20,),
            // Container(
            //   height:heightSize/0.8,
            //   width:widthSize/1 ,
            //   color: CustomColors.lightSky,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Image.asset('assets/logo/logo.png',height: 120,width: 100,),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.only(left:10.0,right: 10),
            //         child: Text('Ramnaam is an e-nest offering you a pool of handpicked professional'
            //             ' Ramnaam anywhere in the world! Finding local services just got easier,'
            //             ' be it a photographer or a live band, at Ramnaam you can hire professionals '
            //             'that are reliable no matter what your location is. '
            //             'Take memories back with you when you travel with quality local services at Ramnaam!',
            //           style: TextStyle(fontSize: 20,),
            //         ),
            //       ),
            //       SizedBox(height: 20,),
            //       const Padding(
            //         padding: EdgeInsets.only(left: 10.0),
            //         child: Text('Categories',style: TextStyle(
            //             color:CustomColors.secondaryColor,fontWeight: FontWeight.w500,fontSize:30),),
            //       ),
            //       Row(children: [
            //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
            //         TextButton(onPressed:(){},
            //             child:Text('Pandit Ji',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
            //       ],),
            //       Row(children: [
            //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
            //         TextButton(onPressed:(){},
            //             child:Text('Photographer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
            //       ],),
            //       Row(children: [
            //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
            //         TextButton(onPressed:(){},
            //             child:Text('Tent House',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
            //       ],),
            //       Row(children: [
            //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
            //         TextButton(onPressed:(){},
            //             child:Text('Caters',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
            //       ],),
            //       Row(children: [
            //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
            //         TextButton(onPressed:(){},
            //             child:Text('Grocery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
            //       ],)
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
