import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import 'customDrawerTile.dart';

class ramnaamDrawer extends StatefulWidget {
  const ramnaamDrawer({Key? key}) : super(key: key);

  @override
  State<ramnaamDrawer> createState() => _ramnaamDrawerState();
}

class _ramnaamDrawerState extends State<ramnaamDrawer> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: size.width,
                height: size.height / 1.2,
                decoration: BoxDecoration(
                    color:CustomColors.whiteColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(90))
                ),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDrawerTile(tileName: 'My Profile', tileIcon:Icon(Icons.person,color: Colors.white,),onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },),
                    CustomDrawerTile(tileName: 'Change Password', tileIcon:Icon(Icons.lock,color: Colors.white), onTap: (){
                      //Get.to(ForgetPassword());
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                      },),
                    CustomDrawerTile(tileName: 'Search Location', tileIcon:Icon(Icons.search_rounded,color: Colors.white),onTap: (){
                      //Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchMap()));
                      },),
                    CustomDrawerTile(tileName: 'Notification', tileIcon:Icon(Icons.notifications,color: Colors.white),onTap: (){
                     // Get.to(NotificationScreen());
                    }),
                    CustomDrawerTile(tileName: 'Contact Us', tileIcon:Icon(Icons.contact_phone,color: Colors.white), onTap: (){
                     // Get.to(ContactUsScreen());
                      },),
                    CustomDrawerTile(tileName: 'Privacy Policy', tileIcon:Icon(Icons.lock,color: Colors.white), onTap: (){
                     // Get.to(PrivacyPolicyScreen());
                      },),
                    CustomDrawerTile(tileName: 'Terms & Conditions', tileIcon:Icon(Icons.quick_contacts_dialer,color: Colors.white),onTap: (){
                      //Get.to(TermsAndConditionScreen());
                      },),
                    CustomDrawerTile(tileName: 'Share App', tileIcon:Icon(Icons.share,color: Colors.white),onTap: (){
                      //Get.to(share());
                      },),
                    CustomDrawerTile(tileName: 'Sign Out',
                      tileIcon:Icon(Icons.logout,color: Colors.white),onTap: (){
                      //openLogoutDialog();
                    },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    ));
  }
}

