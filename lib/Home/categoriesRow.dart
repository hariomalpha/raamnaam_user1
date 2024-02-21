import 'package:flutter/material.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/Category/CaterCategory.dart';
import 'package:raamnaam/View/Category/GroceryCategory.dart';
import 'package:raamnaam/View/Category/PhotographerCategory.dart';
import 'package:raamnaam/View/Category/PurohitCategory.dart';
import 'package:raamnaam/View/Category/TentHouseCategory.dart';

// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: [
//       InkWell(
//         onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>PurohitCategory()));
//         },
//         child: Column(
//           children: [
//             Container(
//               width: 56,
//               height: 56,
//               decoration:const BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey, // Shadow color
//                     offset: Offset(0, 2), // Offset of the shadow
//                     blurRadius: 2, // Blur radius of the shadow
//                     spreadRadius: 1, // Spread radius of the shadow
//                   ),
//                 ],
//                 borderRadius: BorderRadius.all(Radius.circular(7)),
//                 color: CustomColors.whiteColor,
//               ),
//               child:Image.asset("assets/images/PANDIT.png"),
//
//       ),
//             const SizedBox(height: 6,),
//             const Text("Purohit",style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 12
//             ),)
//           ],
//         ),
//       ),
//       const SizedBox(width: 8,),
//       InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>TentHouseCategory()));
//         },
//         child: Column(
//           children: [
//             Container(
//               width: 56,
//               height: 56,
//               decoration: const BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey, // Shadow color
//                       offset: Offset(0, 2), // Offset of the shadow
//                       blurRadius: 2, // Blur radius of the shadow
//                       spreadRadius: 1, // Spread radius of the shadow
//                     ),
//                   ],
//                   borderRadius: BorderRadius.all(Radius.circular(7)),
//                   color: CustomColors.whiteColor,
//               ),
//               child:Image.asset("assets/logo/Group 72817.png"),
//             ),
//             const SizedBox(height: 6,),
//             const Text("Tent House",style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 12
//             ),)
//           ],
//         ),
//       ),
//       const SizedBox(width: 8,),
//       InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>CaterCategory()));
//         },
//         child: Column(
//           children: [
//             Container(
//               width: 56,
//               height: 56,
//               decoration: const BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey, // Shadow color
//                     offset: Offset(0, 2), // Offset of the shadow
//                     blurRadius: 2, // Blur radius of the shadow
//                     spreadRadius: 1, // Spread radius of the shadow
//                   ),
//                 ],
//                   borderRadius: BorderRadius.all(Radius.circular(7)),
//                 color: CustomColors.whiteColor,
//               ),
//               child:Image.asset("assets/images/CATERS.png"),
//             ),
//             const SizedBox(height: 6,),
//             const Text("Cater",style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 12
//             ),)
//           ],
//         ),
//       ),
//       const SizedBox(width: 8,),
//       InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotographerCategory()));
//         },
//         child: Column(
//           children: [
//             Container(
//               width: 56,
//               height: 56,
//               decoration: const BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey, // Shadow color
//                     offset: Offset(0, 2), // Offset of the shadow
//                     blurRadius: 2, // Blur radius of the shadow
//                     spreadRadius: 1, // Spread radius of the shadow
//                   ),
//                 ],
//                   borderRadius: BorderRadius.all(Radius.circular(7)),
//                   color: CustomColors.whiteColor,
//               ),
//               child: Image.asset("assets/images/photographer.png"),
//             ),
//             const SizedBox(height: 8,),
//             const Text("Photographer",style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 12
//             ),)
//           ],
//         ),
//       ),
//       const SizedBox(width: 6,),
//       InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>GroceryCategory()));
//         },
//         child: Column(
//           children: [
//             Container(
//               width: 56,
//               height: 56,
//               decoration: const BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey, // Shadow color
//                     offset: Offset(0, 2), // Offset of the shadow
//                     blurRadius: 2, // Blur radius of the shadow
//                     spreadRadius: 1, // Spread radius of the shadow
//                   ),
//                 ],
//                   borderRadius: BorderRadius.all(Radius.circular(7)),
//                 color: CustomColors.whiteColor,
//               ),
//               child: Image.asset("assets/images/GROCERY.png"),
//             ),
//             const SizedBox(height: 6,),
//             const Text("Grocery",style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 12
//             ),)
//           ],
//         ),
//       ),
//
//     ],
//   ),
// ),
// CarouselSlider(
//     items: [
//       Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(height: 90,width: 350,
//           decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Grocerybanner.png'),
//               fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(10)),),
//       ),
//       Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(height: 70,width: 350,
//           decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Artboardservices.png'),
//               fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(10)),),
//       ),
//       Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(height: 70,width: 350,
//           decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Photographyservice.png'),
//               fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(10)),),
//       ),
//       Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(height: 70,width: 350,
//           decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/Homewelcome.jpg'),
//               fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(10)),),
//       ),
//       Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(height: 70,width: 350,
//           decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/photographers.jpg'),
//               fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(10)),),
//       ),
//       Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(height: 70,width: 370,
//           decoration:BoxDecoration(image: const DecorationImage(image: AssetImage('assets/images/weddingimage2.jpg'),
//               fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(10)),),
//       )
//     ], options:CarouselOptions(height: 160,autoPlay: true)),
// Positioned(
//   bottom: 0,
//   height: 40,
//   left: 0,
//   width: 0,
//   child: Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children:<Widget>[
//         Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal: 2.0),
//             decoration: const BoxDecoration(
//               color:CustomColors.primaryColor,
//               shape: BoxShape.circle,
//             )),
//         Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal: 2.0),
//             decoration: const BoxDecoration(
//               color:CustomColors.primaryColor,
//               shape: BoxShape.circle,
//             )),
//         Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal: 2.0),
//             decoration: const BoxDecoration(
//               color:CustomColors.primaryColor,
//               shape: BoxShape.circle,
//             )),
//         Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal: 2.0),
//             decoration: const BoxDecoration(
//               color:CustomColors.primaryColor,
//               shape: BoxShape.circle,
//             )),
//         Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(
//                 vertical: 10.0,
//                 horizontal: 2.0),
//             decoration: const BoxDecoration(
//               color:CustomColors.primaryColor,
//               shape: BoxShape.circle,
//             ))
//       ]
//   ),
// ),
class CategoriesRow extends StatelessWidget {
    CategoriesRow({Key? key}) : super(key: key);
  final List<String> categoryNames = ["Purohit",'Tent House','Cater','Photographer','Grocery'];
  final List<String>  categoryImages = ["assets/images/PANDIT.png","assets/logo/Group 72817.png","assets/images/CATERS.png","assets/images/photographer.png","assets/images/GROCERY.png"];
  final List<Widget> widgetList = [const PurohitCategory(),const TentHouseCategory(),const CaterCategory(),const PhotographerCategory(),const GroceryCategory()];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: categoryNames.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>widgetList[index]));
                },
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, // Shadow color
                            offset: Offset(0, 2), // Offset of the shadow
                            blurRadius: 2, // Blur radius of the shadow
                            spreadRadius: 1, // Spread radius of the shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: CustomColors.whiteColor,
                      ),
                      child: Image.asset(categoryImages[index]),
                    ),
                    const SizedBox(height: 6,),
                     Text(
                       categoryNames[index],
                       style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                    ),)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
