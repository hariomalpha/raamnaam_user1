import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
   late final Future getCartItems ;

  getCartItem() async {

  }

  @override
  void initState() {
   getCartItems = getCartItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text("My Cart"),
      ),
      body: FutureBuilder(
        future: getCartItems,
          builder: (_,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children:const [
                    
                  ],
                ),
              ),
            );
          }
          else if(snapshot.hasError){
            return const Center(child: Text("Something went wrong!!"),) ;
          }
          else{
          return  ListView.builder(
              itemCount: 6,
              itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Expanded(
                              flex:3,child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/omimage.jpg",fit: BoxFit.fill,),
                              )),
                          Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const   Expanded(
                                          child: Text(
                                            "Booking Id :",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )),
                                      const   SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: Text("obj['id']")),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      const   Expanded(
                                          child: Text(
                                            "Booking Id :",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )),
                                      const   SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: Text("obj['id']")),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      const   Expanded(
                                          child: Text(
                                            "Booking Id :",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )),
                                      const   SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: Text("obj['id']")),
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      const   Expanded(
                                          child: Text(
                                            "Booking Id :",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )),
                                      const   SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: Text("obj['id']")),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                              child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primaryColor
                                ),
                                child: const Text(
                                  "Save For Later",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                              )),
                          const   SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primaryColor
                                ),
                                child: const Text(
                                  "Remove",
                                  style: TextStyle(fontSize: 14),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
          }
          //  return const Center(
          //     child: Text('Your Cart Is Empty',style: TextStyle(color: CustomColors.blackTemp,fontSize: 20),),);
          // }
          })


    );
  }
  // Column(
  // children:<Widget>[
  // // Center(
  // //   child: Padding(
  // //     padding: const EdgeInsets.all(8.0),
  // //     child: Image.asset('assets/logo/app icon.png',height: 150,width: 150,),
  // //   ),
  // // ),
  // // const SizedBox(height: 40,),
  // // Stack(
  // //   children: [
  // //     Row(
  // //       mainAxisAlignment: MainAxisAlignment.end,
  // //       children: [
  // //         Padding(
  // //           padding: const EdgeInsets.only(right:40.0,bottom: 5),
  // //           child: Image.asset('assets/logo/app icon.png',height: 90,width: 100,),
  // //         ),
  // //         const SizedBox(width: 60,),
  // //         Column(
  // //           mainAxisAlignment: MainAxisAlignment.end,
  // //           children: const [
  // //             Icon(Icons.shopping_cart,color:CustomColors.secondaryColor,size:30,),
  // //             SizedBox(width: 10,),
  // //             Text('Cart',style: TextStyle(color:CustomColors.secondaryColor,fontSize:15),)
  // //           ],
  // //         ),
  // //         const SizedBox(width: 30,),
  // //         Padding(
  // //           padding: const EdgeInsets.only(right:35.0,bottom: 5),
  // //           child: Column(
  // //             mainAxisAlignment: MainAxisAlignment.end,
  // //             children: const [
  // //               Icon(Icons.shopping_cart_checkout_rounded,color:CustomColors.secondaryColor,size:30,),
  // //               SizedBox(width: 10,),
  // //               Text('Service',style: TextStyle(color:CustomColors.secondaryColor,fontSize:15),)
  // //             ],
  // //           ),
  // //         )
  // //       ],
  // //     ),
  // //   ],
  // // ),
  // // SizedBox(height:20,),
  // // SizedBox(
  // //   width: widthSize/1.1,
  // //   height: 47,
  // //   child: TextFormField(
  // //     decoration: InputDecoration(
  // //         border:OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
  // //         hintText:'What are you looking for?',
  // //         suffixIcon: Container(
  // //             height: 45,
  // //             width: 80,
  // //             decoration: BoxDecoration(
  // //                 color: CustomColors.primaryColor,
  // //                 borderRadius: BorderRadius.circular(5)),
  // //             child: Icon(Icons.search,color: CustomColors.whiteColor,size:40,))
  // //     ),
  // //   ),
  // // ),
  // // SizedBox(height: 20,),
  // // Container(height: 80,
  // //   width: widthSize/1,
  // //   color:CustomColors.lightSky,
  // //   child: Center(child: Text('Cart',style: TextStyle(color: CustomColors.blackTemp,fontSize: 30),)),
  // // ),
  // const Center(
  // child: Text('Your Cart Is Empty',style: TextStyle(color: CustomColors.blackTemp,fontSize: 20),
  // ),
  // ),
  // // SizedBox(height: 20,),
  // // Container(
  // //   height:heightSize/0.8,
  // //   width:widthSize/1 ,
  // //   child: Column(
  // //     crossAxisAlignment: CrossAxisAlignment.start,
  // //     children: [
  // //
  // //       Padding(
  // //         padding: const EdgeInsets.only(left:10.0,right: 10),
  // //         child: Text('Ramnaam is an e-nest offering you a pool of handpicked professional'
  // //             ' Ramnaam anywhere in the world! Finding local services just got easier,'
  // //             ' be it a photographer or a live band, at Ramnaam you can hire professionals '
  // //             'that are reliable no matter what your location is. '
  // //             'Take memories back with you when you travel with quality local services at Ramnaam!',
  // //           style: TextStyle(fontSize: 20,),
  // //         ),
  // //       ),
  // //       SizedBox(height: 20,),
  // //       Padding(
  // //         padding: const EdgeInsets.only(left: 10.0),
  // //         child: Text('Categories',style: TextStyle(
  // //             color:CustomColors.secondaryColor,fontWeight: FontWeight.w500,fontSize:30),),
  // //       ),
  // //       Row(children: [
  // //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
  // //         TextButton(onPressed:(){},
  // //             child:Text('Pandit Ji',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
  // //       ],),
  // //       Row(children: [
  // //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
  // //         TextButton(onPressed:(){},
  // //             child:Text('Photographer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
  // //       ],),
  // //       Row(children: [
  // //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
  // //         TextButton(onPressed:(){},
  // //             child:Text('Tent House',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
  // //       ],),
  // //       Row(children: [
  // //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
  // //         TextButton(onPressed:(){},
  // //             child:Text('Caters',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
  // //       ],),
  // //       Row(children: [
  // //         Icon(Icons.arrow_forward_ios,color: CustomColors.secondaryColor,),
  // //         TextButton(onPressed:(){},
  // //             child:Text('Grocery',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: CustomColors.blackTemp),))
  // //       ],)
  // //     ],
  // //   ),
  // // )
  // ],
  // ),

}
