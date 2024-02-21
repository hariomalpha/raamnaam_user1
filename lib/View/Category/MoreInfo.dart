import 'package:flutter/material.dart';
import 'package:raamnaam/View/appBar/appBar.dart';

import '../../Utils/colors.dart';
import 'JoinUs.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        title: Text('Member Profile'),
        content: Stack(

          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/5,
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                    ),
                    // child:,
                  ),
                  const SizedBox(height: 20,),
                  const Text('Caters Community',style: TextStyle(fontSize: 12),),
                  const SizedBox(height: 40,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ListTile(title:Text('All Members Listing',style: TextStyle(fontSize:18, fontWeight: FontWeight.w500),),),
                  ),
                  const Divider(color: Colors.red,),
               Card(
                      elevation: 4,
                      child: Padding(padding: EdgeInsets.all(10),
                        child:Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Member 0',style: TextStyle(fontSize:18, fontWeight: FontWeight.w500)),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('UserName'),Text('Mobile'),Text('Address'),
                              ],
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            /*Positioned(
              right: MediaQuery.of(context).size.width/5,
              top: MediaQuery.of(context).size.height/4,
              child:Text('Caters Community',style: TextStyle(fontSize: 12),),
            ),*/
            Positioned(
              // right: MediaQuery.of(context).size.width/3.5,
              // top: MediaQuery.of(context).size.height/6,
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height/6,
              child:CircleAvatar(

                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
            // Positioned(
            //   left: 10,
            //   top: MediaQuery.of(context).size.height,
            //   child:Card(
            //     color: Colors.red,
            //     child: IconButton(onPressed: (){},
            //     icon: Icon(Icons.close,color: Colors.white,),),
            //   )
            // )

            // Positioned(
            //       bottom: 50,
            //         child: CircleAvatar(
            //           radius: 20,
            //             backgroundColor: Colors.white,
            //             child: Icon(
            //               Icons.person,
            //               color: Colors.black,
            //             ),
            // ),)
            // // ListTile(
            // //           leading:
            // //           title: Text('Member 1'),
            // //     )),
            //
            //   ],
            // ),
          ],
        ),
      );
    },
  );
}


class _MoreInfoState extends State<MoreInfo> {
  List<Map<String,dynamic>>infoList =
  [
    {'image':'assets/images/shreeRaam.jpg','title':'Student Community',},
    {'image':'assets/images/photographer2.jpg','title':'Photographer Community',},
    {'image':'assets/images/weddingimage2.jpg','title':'Caters Community',},
    {'image':'assets/images/weddingimage.jpg','title':'Tent House Community',},
    {'image':'assets/images/grahpooja.jpg','title':'Grocery Community',},
    {'image':'assets/images/shreeRaam.jpg','title':'Student Community',},
   
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar("More Information"),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
        Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*3 ,
        margin: EdgeInsets.all( 10),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: infoList.length,
            itemBuilder: (BuildContext context, int index) {
              return   Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.3,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(infoList[index]["image"],
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(infoList[index]["title"],style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                           height: 60,
                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui",
                            style: TextStyle(
                                fontSize: 11,
                                color: CustomColors.blackTemp.withOpacity(0.5),
                                overflow:TextOverflow.ellipsis,
                            ),
                          maxLines: 4),
                        ),

                        SizedBox(height: 10,),
                        Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox( width:21),

                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinUs()));
                                },

                                child: Container(
                                   width: 110,
                                  alignment: Alignment.center,
                                  child: Text("Join Us", style:TextStyle(fontSize: 14,
                                      color:CustomColors.whiteColor)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:CustomColors.primaryColor,
                                  side: const BorderSide(
                                    width: 0.5,
                                    color:CustomColors.primaryColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5))                                  ),),
                              ),

                              SizedBox( width:6),
                              ElevatedButton(
                                onPressed: () {
                                  _showAlertDialog(context);
                                },

                                child:  Container(
                                  width: 110,
                                  alignment: Alignment.center,
                                  child: Text("Group Member", style:TextStyle(fontSize: 13,
                                      color:CustomColors.primaryColor)),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:CustomColors.whiteColor ,
                                    side: BorderSide(
                                      width: 0.5,
                                      color:CustomColors.primaryColor,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    )),
                              ),

                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
