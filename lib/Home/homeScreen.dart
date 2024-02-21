

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raamnaam/Home/categoriesRow.dart';
import 'package:raamnaam/Home/categoryServiesListView.dart';
import 'package:raamnaam/Inquiry/about_us.dart';
import 'package:raamnaam/Inquiry/contact_us.dart';
import 'package:raamnaam/View/AddToCart/MyBooking.dart';
import 'package:raamnaam/View/Category/NotificationScreen.dart';
import 'package:raamnaam/View/PrivacyPolicyScreen.dart';
import 'package:raamnaam/View/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Utils/colors.dart';
import '../View/AuthView/login.dart';
import '../View/Cart.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List cartItemList = [];
  // String? _selectedCategory;
  String? time;
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  final CarouselController carouselController = CarouselController();
  List imageList = [
    {"id": 1, "image_path": "assets/images/Grocerybanner.png"},
    {"id": 2, "image_path": "assets/images/Artboardservices.png"},
    {"id": 3, "image_path": "assets/images/Photographyservice.png"},
    {"id": 4, "image_path": "assets/images/Homewelcome.jpg"},
    {"id": 5, "image_path": "assets/images/weddingimage2.jpg"}
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
               Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: CustomColors.primaryColor, // Change this to the desired color
                // You can also customize other button properties here, such as text color, elevation, padding, etc.
              ),
            ),
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                SystemNavigator.pop();
              },
              style: ElevatedButton.styleFrom(
                primary: CustomColors.primaryColor, // Change this to the desired color
                // You can also customize other button properties here, such as text color, elevation, padding, etc.
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthSize =MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        bool exit = (await _showExitConfirmationDialog(context)) as bool;
        return exit;
      },
      child: Scaffold(
        key: _key,
         appBar: AppBar(
           backgroundColor: CustomColors.primaryColor,
           // leading: GestureDetector(
           //     onTap: () {
           //      _key.currentState!.openDrawer();
           //     },
           //     child:const Icon(Icons.dehaze_rounded,color: CustomColors.whiteColor,)),
           title: Row(
             mainAxisSize: MainAxisSize.min
               ,
               children:[
                  const Icon(Icons.location_on_outlined,color: CustomColors.whiteColor,
                      size: 20,),
                 SizedBox(
                     width: MediaQuery.of(context).size.width/2.5,
                     child:const Text('Indore,Vijay Nagar Indore',overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         fontSize: 15
                       ),
                     ))
           ]),
           actions: [
             Stack(
               clipBehavior: Clip.none,
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                   },
                   child: Container(
                     margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
                     decoration:const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(6)),
                       color:CustomColors.whiteColor,
                     ),
                     child:const Padding(
                       padding:  EdgeInsets.all(6.0),
                       child: Icon(Icons.shopping_cart,color: CustomColors.primaryColor,size: 20,),
                     ),
                   ),
                 ),
                 Positioned(
                   top: -4,
                   right: -4,
                   child: Container(
                     padding: const EdgeInsets.all(6),
                     decoration: const BoxDecoration(
                       color: Colors.red,
                       shape: BoxShape.circle
                     ),
                     child: Text("${cartItemList.length}"),
                   ),
                 )
               ],
             ),
             Stack(
               children: [
                 InkWell(
                   onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                 },
                   child: Container(
                     margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
                     decoration:const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(6)),
                       color:CustomColors.whiteColor,
                     ),
                     child: const Padding(
                       padding:  EdgeInsets.all(6.0),
                       child: Icon(Icons.notifications,color: CustomColors.primaryColor,size: 20,),
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(width: 4,)
           ],
         ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // autofocus: true,
                        decoration: InputDecoration(
                          isDense: true,
                            border:OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            hintText:'What are you looking for?',
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                        padding:const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: CustomColors.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child:const Icon(Icons.search,color: CustomColors.whiteColor,size:24,))
                  ],
                ),
                const SizedBox(height: 20,),
                CategoriesRow(),
                const SizedBox(height: 10,),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CarouselSlider(
                        items: imageList
                            .map(
                              (item) => Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                item['image_path'],
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {

                              currentIndex.value = index;

                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    ValueListenableBuilder(
                      valueListenable: currentIndex,
                      builder: (_,index,child) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: AnimatedSmoothIndicator(
                            activeIndex: index,
                            count: imageList.length,
                            effect: SlideEffect(
                              spacing:  5.6,
                              radius:  10.0,
                              dotWidth:  7.0,
                              dotHeight:  7.0,
                              dotColor: CustomColors.primaryColor.withOpacity(0.4),
                              activeDotColor: CustomColors.primaryColor,
                            ),),
                        );
                      }
                    )
                  ],
                ),
                const SizedBox(height: 5,),
                CategoryServicesListView(categoryName: "Purohit", height: MediaQuery.of(context).size.height /3.5),
                CategoryServicesListView(categoryName: "Tent House", height: MediaQuery.of(context).size.height /3),
                CategoryServicesListView(categoryName: "Caters", height: MediaQuery.of(context).size.height /2.6),
                CategoryServicesListView(categoryName: "Photographer", height: MediaQuery.of(context).size.height /2.5),
                CategoryServicesListView(categoryName: "Grocery", height: MediaQuery.of(context).size.height /2.6),

              ],
            ),
          ),
        ),
        drawer: Drawer(
            backgroundColor:CustomColors.primaryColor,
            child: ListView(
              children: [

                ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  leading: const CircleAvatar(
                    radius: 32,
                    backgroundColor: CustomColors.whiteColor,
                    foregroundImage: AssetImage('assets/logo/app icon.png'),) ,
                    title:    Text("RamNaam",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w500,fontSize:16)),
                    subtitle: Text("RamNaam.com",style:TextStyle(color:CustomColors.whiteColor,)),
                ),
                const SizedBox(height: 10,),
                const Divider(
                  color: Colors.white38,
                  thickness: 1,
                ),
                const SizedBox(height: 10,),

                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  const homeScreen()));
                  },
                  leading: const Icon(Icons.home,color:CustomColors.whiteColor),
                  title:const Text("Home",style: TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20),),
                  ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyBookingScreen()));
                  },
                  leading: const Icon(Icons.category_outlined,color:CustomColors.whiteColor,),
                  title: const Text("My Booking",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20)),
                  ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutUs()));
                  },
                  leading: const Icon(Icons.account_box_outlined,color:CustomColors.whiteColor,),
                  title: const Text("About us",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20)),
                  ),

                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactUs()));
                  },
                  leading:const Icon(Icons.phone,color:CustomColors.whiteColor,),
                  title:const Text("Contact us",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20)),
                  ),

                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivacyPolicyScreen()));
                  },
                  title:const Text("Privacy Policy",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20)),
                leading:const Icon(Icons.privacy_tip_rounded,color: CustomColors.whiteColor,) ,),

                ListTile(
                  onTap: showConfirmLogOutDialog,
                  leading: const  Icon(Icons.logout,color: CustomColors.whiteColor,),
                  title:const Text("Logout",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20)),
                   ),
              ],
            ),
          ),
      ),
    );
  }
  setLogOut()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogIn", false);
  }
  showConfirmLogOutDialog(){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: const Text("Are you sure You want to logout?"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.secondaryColor,
                        foregroundColor:CustomColors.primaryColor
                    ),
                    child:const Text("No")),
                ElevatedButton(
                    onPressed: (){
                      setLogOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primaryColor,

                    ),
                    child:const Text("Yes")),
              ],
            ),
          );
        });

  }
}
// Container(
//   margin: EdgeInsets.all(20),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text("Donation",
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: CustomColors.primaryColor
//         ),
//       ),
//       SizedBox(height: 4,),
//       Text("Your small contribution means a lot.",
//         style: TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.normal,
//             color: CustomColors.blackTemp
//         ),
//       ),
//
//     ],
//   ),
// ),
// Container(
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height/4,
//   child:Image.asset('assets/images/Homewelcome.jpg',
//     fit: BoxFit.fill,),
// ),
// Container(
//   margin: EdgeInsets.only(left: 10,right: 10,top: 20),
//   child: Card(
//     elevation: 3,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10.0),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(
//           // margin: EdgeInsets.all(5),
//           height:MediaQuery.of(context).size.height/5,
//           width: MediaQuery.of(context).size.width/2.5,
//           child:  Image.asset("assets/images/img.png",
//             fit: BoxFit.cover,),
//         ),
//
//         Container(
//           width: MediaQuery.of(context).size.width/2.062,
//           height:MediaQuery.of(context).size.height/3,
//           margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.favorite,color: CustomColors.primaryColor,),
//                   Text("About Our Community",style: TextStyle(
//                    color: CustomColors.primaryColor,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500
//
//                   ),),
//                 ],
//               ),
//               SizedBox(height: 7,),
//               Text("FOR A BETTER COMMUNITY,",style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12,
//
//               ),),
//
//               Text("HELP EACH OTHER,",style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//
//               ),),
//               SizedBox(height: MediaQuery.of(context).size.height/60,),
//               SingleChildScrollView(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width/2.062,
//                   height:MediaQuery.of(context).size.height/6,
//                   child: ReadMoreText("People who are interested in understanding Dharma, religion, and passionate about discovering the purpose of life and what it is to be a Hindu, and for all those who want to bring in the change and act responsibly as per our Hindu dharma principles and celebrate life to the fullest. Bring in the auspicious change in the nation and uphold Vedic principles, customs and traditions which must be protected at all costs. This is achieved by taking actions in the community to share and educate worldwide audience with their strong experience and expertise ensuring our customs are not lost for future generations. Anybody can become a member who wants to learn, debate, discuss, educate, and share the knowledge of Hindu dharmic rituals in the forums and can come from any part of the universe. Practicing Hindu dharma is not just meant for priests, Brahmins, and Indians. It is a way of life and people who believe in vegetarism, and who are coconscious and celebrate life to the fullest can share their experience, parties and events, festival celebrations across the nations within their friends and families can all participate in the community forums by Sharing success stories, pictures, expertise, and videos to the world at large and engage effectively. Not limiting to #families #success #knowledge #achievements #spiritual experiences #stories #process #procedures #enlightment #personal experiences #Godliness #learning mantras #benefits #colorful tent houses, #Holi #lighting, #delicious food #caterers, #orchestra, #artists #fruits and flower, #groceries, #puja samagri, #Silver idols for #gifting, and #performing pujas, et al.",
//                     style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.black.withOpacity(0.6)
//                     ),
//                     trimLines: 7,
//                     colorClickableText: Colors.pink,
//                     trimMode: TrimMode.Line,
//                     trimCollapsedText: 'Show more',
//                     trimExpandedText: 'Show less',
//                     moreStyle: TextStyle(fontSize: 13,
//                         color: Colors.blue),
//                   ),
//                 ),
//               ),
//
//              SizedBox(height: MediaQuery.of(context).size.height/60,),
//
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreInfo()));
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color:CustomColors.primaryColor,
//                       borderRadius: BorderRadius.circular(3)
//                   ),
//                   height: 30,
//                   width: MediaQuery.of(context).size.width/2,
//                   child: Center(
//                     child: Text(
//                       "More Information",
//                       style:  TextStyle(
//                         color:CustomColors.whiteColor,
//                         // fontSize: fSize,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//
//             ],
//           ),
//         ),
//
//       ],
//     ),
//   ),
// ),
// SizedBox(height: MediaQuery.of(context).size.height/30,),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//    const  Text("Purohit Service",
//       style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: CustomColors.primaryColor
//       ),
//     ),
//    const  SizedBox(height: 4,),
//    const Text("Looking for a service? Find your Service here:",
//       style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.normal,
//           color: CustomColors.blackTemp
//       ),
//     ),
//     const SizedBox(height: 8,),
//     Text("${"8"} Services", style: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.bold
//     ),)
//
//   ],
// ),
// // Container(
// //   margin: EdgeInsets.only(left: 20),
// //   child: Text("8 Services",
// //     style: TextStyle(
// //         fontSize: 18,
// //         fontWeight: FontWeight.bold,
// //         color: CustomColors.blackTemp
// //     ),
// //   ),
// // ),
// SizedBox(
//   // width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height /3.5,
//   child: ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 8,
//       itemBuilder: (BuildContext context, int index) {
//         return InkWell(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>PurohitDescription(price:"1200" ,image: "assets/images/panditjiImage.png",product_name:"Service Name" ,)));
//           },
//           child: Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(6)
//             ),
//             child: Container(
//               width: MediaQuery.of(context).size.width/1.8,
//               margin: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Image.asset("assets/images/panditjiImage.png",
//                     height: 140,
//                     width: MediaQuery.of(context).size.width,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(height: 15,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width/3.5,
//                         child:  Text("Service Name",style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             overflow: TextOverflow.ellipsis
//                         ),),
//                       ),
//
//                       Text("\u{20B9}1200",style: TextStyle(
//                           color:CustomColors.blackTemp.withOpacity(0.8)
//                       ),),
//                     ],
//                   ),
//
//
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
// ),
// const SizedBox(height: 16,),
// // SizedBox(height: MediaQuery.of(context).size.height/30,),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const Text("Tent House Service",
//       style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: CustomColors.primaryColor
//       ),
//     ),
//    const  SizedBox(height: 4,),
//     const Text("Looking for a service? Find your Service here:",
//       style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.normal,
//           color: CustomColors.blackTemp
//       ),
//     ),
//     const SizedBox(height: 8,),
//     Text("${"8"} Services", style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold
//     ),)
//
//   ],
// ),
// // Container(
// //   margin: EdgeInsets.only(left: 20),
// //   child: Text("4 Services",
// //     style: TextStyle(
// //         fontSize: 18,
// //         fontWeight: FontWeight.bold,
// //         color: CustomColors.blackTemp
// //     ),
// //   ),
// // ),
// SizedBox(
//   // width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height /3,
//   child: ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 4,
//       itemBuilder: (BuildContext context, int index) {
//         return  Card(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6)
//           ),
//           child: Container(
//             margin: const  EdgeInsets.all(10),
//             width: MediaQuery.of(context).size.width/1.8,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/weddingimage2.jpg",
//                   height: 140,
//                   width: MediaQuery.of(context).size.width,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 7,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                 width: MediaQuery.of(context).size.width/3.5,
//                       child: Text("Service Name",style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.ellipsis
//                       ),),
//                     ),
//                     const SizedBox(height: 3,),
//                     Text("\u{20B9}1200",style: TextStyle(
//                         color:CustomColors.blackTemp.withOpacity(0.5)
//                     ),),
//                   ],
//                 ),
//                 const SizedBox(height: 7,),
//                 Text("These tents are made of a thin fabric, which is attached to supporting ropes or to poles.",
//                   style: TextStyle(
//                       fontSize: 11,
//                       color: CustomColors.blackTemp.withOpacity(0.5),
//                       overflow:TextOverflow.ellipsis
//                   ),),
//                 const SizedBox(height: 10,),
//                 InkWell(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen()));
//
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color:CustomColors.primaryColor,
//                         borderRadius: BorderRadius.circular(5)
//                     ),
//                     height: 30,
//                     width: MediaQuery.of(context).size.width/2,
//                     child: const Center(
//                       child: Text(
//                         "Add to Cart",
//                         style:  TextStyle(
//                           color:CustomColors.whiteColor,
//                           fontSize: 11,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//
//               ],
//             ),
//           ),
//         );
//       }),
// ),
// // SizedBox(height: MediaQuery.of(context).size.height/30,),
// const SizedBox(height: 16,),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const Text("Caters Service",
//       style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: CustomColors.primaryColor
//       ),
//     ),
//    const SizedBox(height: 4,),
//     const Text("Looking for a service? Find your Service here:",
//       style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.normal,
//           color: CustomColors.blackTemp
//       ),
//     ),
//     const SizedBox(height: 8,),
//     Text("${"8"} Services", style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold
//     ),)
//
//   ],
// ),
// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("7 Services",
//     style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: CustomColors.blackTemp
//     ),
//   ),
// ),
// SizedBox(
//   // width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height /2.9,
//   child: ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 7,
//       itemBuilder: (BuildContext context, int index) {
//         return   Card(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6)
//           ),
//           child: Container(
//             width: MediaQuery.of(context).size.width/1.8,
//             margin: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/Bhikshaimage.jpg",
//                   height: 140,
//                   width: MediaQuery.of(context).size.width,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 7,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                 width: MediaQuery.of(context).size.width/3.5,
//                       child: Text("Service Name",style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.ellipsis
//                       ),),
//                     ),
//                     const SizedBox(height: 3,),
//                     Text("\u{20B9}1200",style: TextStyle(
//                         color:CustomColors.blackTemp.withOpacity(0.5)
//                     ),),
//                   ],
//                 ),
//                 const SizedBox(height: 7,),
//                 Text("Shivay caters",
//                   style: TextStyle(
//                       fontSize: 11,
//                       color: CustomColors.blackTemp.withOpacity(0.5),
//                       overflow:TextOverflow.ellipsis
//                   ),),
//                 const SizedBox(height: 10,),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   alignment: Alignment.center,
//                   child: InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen2()));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color:CustomColors.primaryColor,
//                           borderRadius: BorderRadius.circular(5)
//                       ),
//                       height: 30,
//                       width: MediaQuery.of(context).size.width/2,
//                       child: const Center(
//                         child: Text(
//                           "Add to Cart",
//                           style:  TextStyle(
//                             color:CustomColors.whiteColor,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//
//
//               ],
//             ),
//           ),
//         );
//       }),
// ),
// const SizedBox(height: 16,),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const Text("Photographer Service",
//       style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: CustomColors.primaryColor
//       ),
//     ),
//     const SizedBox(height: 4,),
//     const Text("Looking for a service? Find your Service here:",
//       style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.normal,
//           color: CustomColors.blackTemp
//       ),
//     ),
//     const SizedBox(height: 8,),
//     Text("${"8"} Services", style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold
//     ),)
//
//   ],
// ),
// // Container(
// //   margin: EdgeInsets.only(left: 20),
// //   child: Text("5 Services",
// //     style: TextStyle(
// //         fontSize: 18,
// //         fontWeight: FontWeight.bold,
// //         color: CustomColors.blackTemp
// //     ),
// //   ),
// // ),
// SizedBox(
//  // width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height /2.45,
//   child: ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 5,
//       itemBuilder: (BuildContext context, int index) {
//         return   Card(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6)
//           ),
//           child: Container(
//             width: MediaQuery.of(context).size.width/1.8,
//             margin: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/photographer2.jpg",
//                   height: 140,
//                   width: MediaQuery.of(context).size.width,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 7,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width/3.5,
//                       child: Text("Service Name",style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.ellipsis
//                       ),),
//                     ),
//                    const SizedBox(height: 3,),
//                     Text("\u{20B9}1200",style: TextStyle(
//                         color:CustomColors.blackTemp.withOpacity(0.5)
//                     ),),
//                   ],
//                 ),
//                 const SizedBox(height: 7,),
//                 Text("wedding photographer",
//                   style: TextStyle(
//                       fontSize: 11,
//                       color: CustomColors.blackTemp.withOpacity(0.5),
//                       overflow:TextOverflow.ellipsis
//                   ),),
//                 const SizedBox(height: 7,),
//                 Container(
//                   height: 45,
//                   width: double.infinity,
//                   color: Colors.grey.withOpacity(0.2),
//                   child: DropdownButtonFormField<String>(focusColor: Colors.transparent ,
//                     elevation: 2, hint: const Text('Select Hours',
//                     style: TextStyle(fontSize: 14),),
//                     icon: const Icon(Icons.arrow_drop_down),
//                     value: selectedValues.length > index ? selectedValues[index] : null,
//                     items: dropdownValues.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(' $value',style: const TextStyle(fontSize: 14),),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         if (selectedValues.length <= index) {
//                           selectedValues.add(newValue!);
//                         } else {
//                           selectedValues[index] = newValue!;
//                         }
//                       });
//                     },
//                     decoration: const InputDecoration(),
//                   )
//                 ),
//                 const SizedBox(height: 10,),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   alignment: Alignment.center,
//                   child: InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen()));
//
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color:CustomColors.primaryColor,
//                           borderRadius: BorderRadius.circular(5)
//                       ),
//                       height: 30,
//                       width: MediaQuery.of(context).size.width/2,
//                       child:const  Center(
//                         child: Text(
//                           "Add to Cart",
//                           style:  TextStyle(
//                             color:CustomColors.whiteColor,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//
//
//               ],
//             ),
//           ),
//         );
//       }),
// ),
// const SizedBox(height: 16,),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const Text("Grocery Service",
//       style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: CustomColors.primaryColor
//       ),
//     ),
//    const SizedBox(height: 4,),
//     const Text("Looking for a service? Find your Service here:",
//       style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.normal,
//           color: CustomColors.blackTemp
//       ),
//     ),
//     const SizedBox(height: 8,),
//     Text("${"8"} Services", style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold
//     ),)
//
//   ],
// ),
// Container(
//   margin: EdgeInsets.only(left: 20),
//   child: Text("6 Services",
//     style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: CustomColors.blackTemp
//     ),
//   ),
// ),
// SizedBox(
//   //width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height /2.45,
//   child: ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: 5,
//       itemBuilder: (BuildContext context, int index) {
//         return   Card(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6)
//           ),
//           child: Container(
//             width: MediaQuery.of(context).size.width/1.8,
//             margin: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset("assets/images/omimage.jpg",
//                   height: 140,
//                   width: MediaQuery.of(context).size.width,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 7,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width/3.5,
//                       child: Text("Service Name",style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.ellipsis
//                       ),),
//                     ),
//                    const  SizedBox(height: 3,),
//                     Text("\u{20B9}${1200*items[index]}",style: TextStyle(
//                         color:CustomColors.blackTemp.withOpacity(0.5)
//                     ),),
//                   ],
//                 ),
//                 const SizedBox(height: 7,),
//                 Text("puja samagri",
//                   style: TextStyle(
//                       fontSize: 11,
//                       color: CustomColors.blackTemp.withOpacity(0.5),
//                       overflow:TextOverflow.ellipsis
//                   ),),
//                 const SizedBox(height: 7,),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap:(){
//                           setState(() {
//                             if(items[index]>1){
//                               setState(() {
//                                 items[index]=items[index]-item[index];
//                               });
//                             }
//
//                           });
//                         },
//                         child: Container(
//                             alignment: Alignment.center,
//                             height: 25,
//                             width: 25,
//                             decoration: BoxDecoration(
//                                 color:CustomColors.primaryColor,
//                                 borderRadius: BorderRadius.circular(3)
//                             ),
//
//                             child:const Icon(Icons.remove,color: Colors.white,size: 20,weight:900,)
//
//                         ),
//                       ),const SizedBox(width: 10,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/9,
//                         height: 25,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.withOpacity(0.6),
//                             borderRadius: BorderRadius.circular(3)
//                         ),
//
//                         child: Text("${items[index]}",
//                           style: const TextStyle(fontSize: 13),),
//                       ),
//                       const SizedBox(width: 10,),
//                       GestureDetector(
//                         onTap:(){
//                           setState(() {
//                             items[index]=items[index]+item[index];
//                           });
//
//                         },
//                         child: Container(
//                             alignment: Alignment.center,
//                             height: 25,
//                             width: 25,
//                             decoration: BoxDecoration(
//                                 color:CustomColors.primaryColor,
//                                 borderRadius: BorderRadius.circular(3)
//                             ),
//
//                             child:const Icon(Icons.add,color: Colors.white,size: 20,weight:900,)
//
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                const  SizedBox(height: 10,),
//                 InkWell(
//                   onTap: (){
//                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen()));
//
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color:CustomColors.primaryColor,
//                         borderRadius: BorderRadius.circular(3)
//                     ),
//                     height: 30,
//                     width: MediaQuery.of(context).size.width/3.3,
//                     child: const Center(
//                       child: Text(
//                         "Add to Cart",
//                         style:  TextStyle(
//                           color:CustomColors.whiteColor,
//                           fontSize: 11,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//
//
//               ],
//             ),
//           ),
//         );
//       }),
// ),

// Future<DateTime?> _selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2015, 8),
//     lastDate: DateTime(2101),
//
//   );
//   return picked;
// }

// showAlert(){
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return AlertDialog(
//             contentPadding:EdgeInsets.all(0),
//             content: Material(
//               child: Scrollbar(
//                 thumbVisibility: true,
//                 thickness: 5,
//                 child: Container(
//                   height: MediaQuery.of(context).size.height/1.5,
//                   width: MediaQuery.of(context).size.width/1,
//                   color:CustomColors.lightSky,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left:20.0,right: 20),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 20,),
//                           Text('Schedule Date',style: TextStyle(fontSize:25,fontWeight: FontWeight.w700,color:CustomColors.blackTemp),),
//                           Text('Booking Date',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,color:CustomColors.grayColor),),
//                           SizedBox(height: 20,),
//                           Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                                 color:CustomColors.whiteColor,
//                                 border: Border.all(color: CustomColors.grayColor),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                   contentPadding: EdgeInsets.only(left: 10,top:10),
//                                   hintText:'${DateTime}',
//                                 suffixIcon: GestureDetector(
//                                     onTap: () {
//                                       //_showDatePicker(context);
//                                       _selectDate(context);
//                                     },
//                                     child: Icon(Icons.date_range,color: CustomColors.blackTemp,))
//                               ),
//
//                             ),
//
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Radio(
//                                       value: 1,
//                                       groupValue: _value1,
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           _value1 = value!;
//                                         });
//                                       }),
//                                   const Text(
//                                     "With transport",style: TextStyle(fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Radio(
//                                       value: 2,
//                                       groupValue: _value1,
//                                       onChanged: (int? value) {
//                                         setState(() {
//                                           _value1 = value!;
//                                           // isUpi = true;
//                                         });
//                                       }),
//                                   const Text(
//                                     "Without transport",style: TextStyle(fontSize: 20
//                                   ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Text('Special Notes',style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,color:CustomColors.grayColor),),
//                           SizedBox(height: 20,),
//                           Container(
//                             height: 90,
//                             decoration: BoxDecoration(
//                                 color:CustomColors.whiteColor,
//                                 border: Border.all(color: CustomColors.grayColor),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: TextFormField(
//                               decoration: const InputDecoration(
//                                 contentPadding: EdgeInsets.only(left: 10),
//                                   border: InputBorder.none,
//                                   hintText:'Enter Notes',
//                               ),
//
//                             ),
//
//                           ),
//                           SizedBox(height: 10,),
//                           ElevatedButton(onPressed:(){
//                             showAlert();
//                           },
//                               style: ElevatedButton.styleFrom(backgroundColor:CustomColors.secondaryColor,
//                                   maximumSize:Size(130,50) ),
//                               child:Center(child: Text('Save',style: TextStyle(fontSize:15),))),
//                           SizedBox(height: 10,),
//                           Image.asset('assets/images/panditjiImage.png')
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },);
//       }
//   );
// }
// CustomDropDown(){
//
//      List<String> _categories = [
//     'Category A',
//     'Category B',
//     'Category C',
//   ];
//
//   DropdownButton<String>(
//     value: _selectedCategory,
//     hint: Text('Select Category'),
//     items: _categories.map((category) {
//       return DropdownMenuItem<String>(
//         value: category,
//         child: Text(category),
//       );
//     }).toList(),
//     onChanged: (newValue) {
//       setState(() {
//         _selectedCategory = newValue;
//       });
//     },
//   );
// }

// List<Map<String,dynamic>> Services =
// [
//   {'image':'assets/images/Homewelcome.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/omimage.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/wedding1.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/grahpooja.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/Bhikshaimage.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/hawanpooja.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/weddingimage.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/weddingimage2.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/photographers.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/photographer2.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'},
//   {'image':'assets/images/studio.jpg','title':'Grah Pravesh Home','rupee':'900.00','subtitle':'abcdef(with Pooja Samgri)(With fruit and Flowers)'}
//
// ];
//
// int _currentIndex=0;
// int _value1=0;



// int _counter = 0;
// bool isVisible =true;
// void _incrementCounter() {
//   setState(() {
//
//     _counter++;
//   });
// }
// void _decrimentConter() {
//   setState(() {
//     if(_counter==0){
//       setState(() {
//         isVisible=true;
//       });
//     }
//
//     _counter--;
//   });
// }
// List<String> time = List.generate(
//   7,
//       (_) => "1 hr",
// );
// List<int> items = List.generate(
//   7,
//       (_) => 1,
// );
// List<int> item = List.generate(
//   7,
//       (_) => 1,
// );

// List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];