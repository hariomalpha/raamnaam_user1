import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import 'ScheduleDateScreen.dart';

class GroceryCategory extends StatefulWidget {
  const GroceryCategory({Key? key}) : super(key: key);

  @override
  State<GroceryCategory> createState() => _GroceryCategoryState();
}

class _GroceryCategoryState extends State<GroceryCategory> {
  List<int> items = List.generate(
    7,
        (_) => 1,
  );
  List<int> item = List.generate(
    7,
        (_) => 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title:Text("Grocery Category"),
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
                  mainAxisExtent:290,
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 10.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: EdgeInsets.all(8.0), // padding around the grid
                itemCount:7, // total number of items
                itemBuilder: (context, index) {
                  return  Container(
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
                              child: Image.asset("assets/images/omimage.jpg",
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
                                Text("\u{20B9}${1200*items[index]}",style: TextStyle(
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
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        if(items[index]>1){
                                          setState(() {
                                            items[index]=items[index]-item[index];
                                          });
                                        }

                                      });
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        width: 25,
                                        color: CustomColors.primaryColor,

                                        child:Icon(Icons.remove,color: Colors.white,size: 20,weight:900,)

                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/9,
                                    height: 25,
                                    alignment: Alignment.center,
                                    color: Colors.grey.withOpacity(0.6),
                                    child: Text("${items[index]}",
                                      style: TextStyle(fontSize: 13),),
                                  ),
                                  SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        items[index]=items[index]+item[index];
                                      });

                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 25,
                                        width: 25,
                                        color: CustomColors.primaryColor,

                                        child:Icon(Icons.add,color: Colors.white,size: 20,weight:900,)

                                    ),
                                  ),

                                ],
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
