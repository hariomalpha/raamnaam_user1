import 'package:flutter/material.dart';
import 'package:raamnaam/Home/homeScreen.dart';
import 'package:raamnaam/Inquiry/about_us.dart';
import 'package:raamnaam/Inquiry/contact_us.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/AddToCart/MyBooking.dart';
import 'package:raamnaam/View/AuthView/login.dart';
import 'package:raamnaam/View/PrivacyPolicyScreen.dart';
import 'package:raamnaam/View/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: showConfirmLogOutDialog(context),
            leading: const  Icon(Icons.logout,color: CustomColors.whiteColor,),
            title:const Text("Logout",style:TextStyle(color:CustomColors.whiteColor,fontWeight: FontWeight.w700,fontSize:20)),
          ),
        ],
      ),
    );
  }

  setLogOut()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogIn", false);
  }

  showConfirmLogOutDialog(context){
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
