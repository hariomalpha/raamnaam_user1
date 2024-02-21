
import 'package:flutter/material.dart';
import '../Utils/colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    // final w =MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          child: Column(
            children:<Widget>[
              // Image.asset('assets/images/shreeRaam.jpg'),
              // const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('WE DO IT ALL',style: TextStyle(color:CustomColors.secondaryColor,fontSize: 20,fontWeight: FontWeight.w500)),
                  Text('As All Of Us Know That It Is Not Easy To Find Regional '
                      'Pandits For Puja & Religious Functions In Today''s' 'Fast Life',
                    style:TextStyle(color:CustomColors.primaryColor,fontSize:25,fontWeight: FontWeight.w500) ,),
                  SizedBox(height: 20,),
                  Text('Vision',style: TextStyle(color:CustomColors.blackTemp,fontSize: 20,fontWeight: FontWeight.w500)),
                  SizedBox(height: 20,),
                  Text('Our vision is to create auspiciousness and divine value to Indian communities '
                      'living worldwide whilst becoming the top religious service provider to Hindus by '
                      'offering and streamlining associated services and provide single stop solution and '
                      'experience with no hassles in ordering the religious services from residences, '
                      'corporate offices, & factories whilst spreading Hindu Dharma, God’s Divinity,'
                      ' & Love to everyone.',
                      style: TextStyle(color:CustomColors.grayColor,fontSize:15,)),
                  SizedBox(height: 20,),
                  Text('Our Mission',style: TextStyle(color:CustomColors.blackTemp,fontSize: 20,fontWeight: FontWeight.w500)),
                  SizedBox(height: 20,),
                  Text('Our mission is to serve Hindus worldwide to perform religious rituals for all '
                      'occasions using our single automated ordering web and mobile applications and book'
                      ' qualified Pundits, Gift a service and auspicious silver items to friends, & family'
                      ' members living in India, choose Caterers and order your favorite menu, get necessary'
                      'Grocery items for cooking, book Photographers to capture the moments, Send your clicked '
                      'photos in the mobile to Photo studios for printing your memories in a photo album of your '
                      'choice, and book Shamiana / Tent house services including chairs, tables, utensils '
                      'to achieve the festive look, & purchase gandhige samagri needed to perform religious '
                      'services and get everything delivered to your doorstep.',
                      style: TextStyle(color:CustomColors.grayColor,fontSize:15)),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.medical_services_rounded,color: CustomColors.primaryColor,size: 32,),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('We are trusted',style: TextStyle(color: CustomColors.blackTemp,fontWeight: FontWeight.w500,fontSize:16),),
                          Text('Over five years',style: TextStyle(color: CustomColors.blackTemp,fontSize:12)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width:40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.thumb_up,color: CustomColors.primaryColor,size: 32,),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Good Support ',style: TextStyle(color: CustomColors.blackTemp,fontWeight: FontWeight.w500,fontSize:16),),
                          Text('Anytime 24 Hours',style: TextStyle(color: CustomColors.blackTemp,fontSize:12)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
