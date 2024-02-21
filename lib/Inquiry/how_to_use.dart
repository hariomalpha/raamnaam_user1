import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class Howto_use extends StatefulWidget {
  const Howto_use({Key? key}) : super(key: key);

  @override
  State<Howto_use> createState() => _Howto_useState();
}

class _Howto_useState extends State<Howto_use> {
  int _value1=0;


  List<Map<String,dynamic>> Services = [
    {'image':'assets/images/Homewelcome.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
  ];



  @override
  Widget build(BuildContext context) {
    final widthSize =MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
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
                    child: const Center(child: Text('0',style: TextStyle(color: CustomColors.whiteColor),)),
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
                    child: const Center(child: Text('0',style: TextStyle(color: CustomColors.whiteColor),)),
                  ),
                ),
              ],
            ),
            const SizedBox(height:20,),
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
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount:1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation:0,
                  color:CustomColors.lightgray,
                  margin: EdgeInsets.symmetric(vertical:5,horizontal:15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(Services[index]['image'],width:340,),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(Services[index]['title'],style: TextStyle(color:CustomColors.blackTemp,fontWeight: FontWeight.w500,fontSize:18),),
                          SizedBox(width: 50,),
                          Text(Services[index]['rupee'],style: TextStyle(color:CustomColors.blackTemp,fontWeight: FontWeight.w500,fontSize:18)),
                        ],),
                      SizedBox(height: 10,),
                      Text(Services[index]['subtitle'],
                          style: TextStyle(color:CustomColors.grayColor,fontSize: 15)),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right:180.0,bottom:10),
                        child: ElevatedButton(onPressed:(){

                        },
                            style: ElevatedButton.styleFrom(backgroundColor:CustomColors.primaryColor,
                                maximumSize:Size(130,50) ),
                            child:Center(child: Row(
                              children: const [
                                Text('Read More',style: TextStyle(fontSize:15),),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ))),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _value1,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _value1 = value!;
                                    });
                                  }),
                              const Text(
                                "Economy",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _value1,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _value1 = value!;
                                      // isUpi = true;
                                    });
                                  }),
                              const Text(
                                "Standard",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                  value: 3,
                                  groupValue: _value1,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _value1 = value!;
                                      // isUpi = true;
                                    });
                                  }),
                              const Text(
                                "Premium",
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:180.0,bottom:10),
                        child: ElevatedButton(onPressed:(){

                        },
                            style: ElevatedButton.styleFrom(backgroundColor:CustomColors.secondaryColor,
                                maximumSize:Size(130,50) ),
                            child:Center(child: Text('Add to Cart',style: TextStyle(fontSize:15),))),
                      ),
                    ],
                  ),
                );
              },),
            const SizedBox(height: 20,),
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
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Categories',style: TextStyle(
                        color:CustomColors.secondaryColor,fontWeight: FontWeight.w500,fontSize:30),),
                  ),
                  Row(children: [
                    const Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:const Text('Pandit Ji',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    const Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Photographer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    const Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Tent House',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    const Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
                    TextButton(onPressed:(){},
                        child:Text('Caters',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
                  ],),
                  Row(children: [
                    const Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
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
