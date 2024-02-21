import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import 'ScheduleDateScreen.dart';

class PhotographerCategory extends StatefulWidget {
  const PhotographerCategory({Key? key}) : super(key: key);

  @override
  State<PhotographerCategory> createState() => _PhotographerCategoryState();
}

class _PhotographerCategoryState extends State<PhotographerCategory> {
  String? time;
  List<String> hours = List.generate(
    10,
        (_) => "Select Hours",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title:Text("Photographer Category"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                physics:ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent:305,
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 10.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: EdgeInsets.all(8.0), // padding around the grid
                itemCount:10, // total number of items
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.8,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset("assets/images/photographer2.jpg",
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),

                            ),
                            SizedBox(height: 7,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/5,
                                  child: Text("Service Name",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis
                                  ),),
                                ),
                                SizedBox(height: 3,),
                                Text("\u{20B9}1200",style: TextStyle(
                                    color:CustomColors.blackTemp.withOpacity(0.5)
                                ),),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Container(
                              child: Text("These tents are made of a thin fabric, which is attached to supporting ropes or to poles.",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: CustomColors.blackTemp.withOpacity(0.5),
                                    overflow:TextOverflow.ellipsis
                                ),),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              height: 40,
                              color: Colors.grey.withOpacity(0.2),
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                value:time,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black87),

                                items: <String>[
                                  '1 hr',
                                  '5 hr',
                                  '10 hr',
                                  'Full Day',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),

                                hint: Text(
                                  "Select Hours",style: TextStyle(fontSize: 11),
                                ),
                                onChanged: (String? value)  {
                                  setState(() {
                                    time = value!;
                                  });
                                },
                                // icon: Icon(Icons.keyboard_arrow_down),
                                underline: Container(  // Use a container with zero height to remove the underline
                                  height: 0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen()));

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color:CustomColors.primaryColor,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                height: 30,
                                width: MediaQuery.of(context).size.width/2,
                                child: Center(
                                  child: Text(
                                    "Add to Cart",
                                    style:  TextStyle(
                                      color:CustomColors.whiteColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )


                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
