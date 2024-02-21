import 'package:flutter/material.dart';


class Dailog extends StatelessWidget {

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Member Profile'),
          content: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/2.1,
                child:  Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                      ),
                      // child:,
                    ),
                    SizedBox(height: 40,),
                    Container(
                      alignment: Alignment.centerRight,
                      child: ListTile(title:Text('All Members Listing',style: TextStyle(fontSize:18, fontWeight: FontWeight.w500),),),
                    ),
                    Divider(color: Colors.red,),
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
              Positioned(
                right: MediaQuery.of(context).size.width/5,
                top: MediaQuery.of(context).size.height/4,
                child:Text('Caters Community',style: TextStyle(fontSize: 12),),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width/4,
                top: MediaQuery.of(context).size.height/6,
                child:Card(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)),),
                  elevation: 4,
                  child:  CircleAvatar(

                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 32,
                    ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text('Details'),
        ),
      ),
    );
  }
}
