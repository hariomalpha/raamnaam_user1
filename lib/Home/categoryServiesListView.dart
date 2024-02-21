import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raamnaam/Helper/apiStrings.dart';
import 'package:raamnaam/Model/service_model.dart';
import 'package:http/http.dart' as http;
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/Category/PurohitDescription.dart';
import 'package:raamnaam/View/Category/ScheduleDateScreen.dart';
import 'package:raamnaam/View/Category/ScheduleDateScreen2.dart';

class CategoryServicesListView extends StatefulWidget {
  final String categoryName;
  final double height;
  const CategoryServicesListView({Key? key,required this.categoryName,required this.height}) : super(key: key);

  @override
  State<CategoryServicesListView> createState() => _CategoryServicesListViewState();
}

class _CategoryServicesListViewState extends State<CategoryServicesListView> {

  List<ServiceModel?>? purohitServices;
  List<ServiceModel?>? tentHouseServices;
  List<ServiceModel?>? caterServices;
  List<ServiceModel?>? photographerServices;
  List<ServiceModel?>? groceryServices;
  List<String> selectedValues = [];
  List<String> dropdownValues = ['1 hr', '5 hr', '10 hr', 'Full Day '];
  List<int>? items ;
  List<int>? item ;
  Future<List<ServiceModel>?>? getService() async {
    try {
      var headers = {
        'Cookie': 'ci_session=b67852e1ecfd59613ddd97d2762188a2be402e1f'
      };
      var request = http.MultipartRequest(
          'POST',
          getAllServices);
      // request.fields.addAll({
      //   'roll_id': '7'
      // });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        final data = json.decode(result);
        List<ServiceModel> list = data['products']
            .map<ServiceModel>((i) => ServiceModel.fromJson(i))
            .toList();
         purohitServices = list.where((e){
           return e.roll == "7";
         }).toList();
         tentHouseServices = list.where((e){
           return e.roll == "8";
         }).toList();
         caterServices = list.where((e){
           return e.roll == "5";
         }).toList();
         photographerServices = list.where((e){
           return e.roll == "6";
         }).toList();
         if(widget.categoryName == "Caters"){
          items = List.generate(
             caterServices!.length,
                 (_) => 1,
           );
          item = List.generate(
            caterServices!.length,
                (_) => 1,
          );
         }
        // debugPrint("++++++++++++++++++++${photographerServices!.first!.servicesImage.toString()}");
         groceryServices = list.where((e){
           return e.roll == "1";
         }).toList();
        if(widget.categoryName == "Grocery"){
          items = List.generate(
            groceryServices!.length,
                (_) => 1,
          );
          item = List.generate(
            groceryServices!.length,
                (_) => 1,
          );
        }
        // list.removeWhere((element) => element.plans != '6');
        return list;
      } else {
        debugPrint(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getService(),
        builder:(_,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Padding(
            padding:  EdgeInsets.all(24.0),
            child:  Center(child: CircularProgressIndicator(),),
          );
        }
        else if(snapshot.hasError){
          return const Center(child: Text("something wrong!!"),);
        }
        else if(snapshot.hasData){
          if(snapshot.data != null || snapshot.data!.isNotEmpty){
            List<ServiceModel>? services = snapshot.data;
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,),
                Text("${widget.categoryName} Service",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryColor
                  ),
                ),
                const SizedBox(height: 4,),
                const Text("Looking for a service? Find your Service here:",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: CustomColors.blackTemp
                  ),
                ),
                const SizedBox(height: 8,),


                Text(
                  "${widget.categoryName == "Purohit"?
                  purohitServices!.length.toString():
                  widget.categoryName == "Tent House"?
                  tentHouseServices!.length.toString():
                  widget.categoryName == "Caters"?
                  caterServices!.length.toString():
                  widget.categoryName == "Photographer"?
                  photographerServices!.length.toString():
                  groceryServices!.length.toString()} Services"
                  , style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 8,),
                SizedBox(
                  height: widget.height ,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.categoryName == "Purohit"?
                      purohitServices!.length:
                      widget.categoryName == "Tent House"?
                      tentHouseServices!.length:
                      widget.categoryName == "Caters"?
                      caterServices!.length:
                      widget.categoryName == "Photographer"?
                      photographerServices!.length:
                      groceryServices!.length,
                      itemBuilder: (_,index){
                        if(widget.categoryName == "Purohit"){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PurohitDescription(serviceValue: purohitServices![index],)));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width/1.8,
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(purohitServices![index]!.serviceImg.toString(),
                                      height: 140,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          child:  Text(purohitServices![index]!.artistName.toString(),style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis
                                          ),),
                                        ),

                                        Text("\u{20B9}${purohitServices![index]!.mrpPrice.toString()}",style: TextStyle(
                                            color:CustomColors.blackTemp.withOpacity(0.8)
                                        ),),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        else if(widget.categoryName == "Tent House"){
                          return  Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Container(
                              margin: const  EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width/1.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(tentHouseServices![index]!.serviceImg.toString(),
                                    height: 140,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 7,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        child: Text(tentHouseServices![index]!.artistName.toString(),style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis
                                        ),),
                                      ),
                                      const SizedBox(height: 3,),
                                      Text("\u{20B9}${tentHouseServices![index]!.mrpPrice.toString()}",style: TextStyle(
                                          color:CustomColors.blackTemp.withOpacity(0.5)
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  Text("These tents are made of a thin fabric, which is attached to supporting ropes or to poles.",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: CustomColors.blackTemp.withOpacity(0.5),
                                        overflow:TextOverflow.ellipsis
                                    ),),
                                  const SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen()));

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:CustomColors.primaryColor,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      height: 30,
                                      width: MediaQuery.of(context).size.width/2,
                                      child: const Center(
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
                          );
                        }
                        else if(widget.categoryName == "Caters"){
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(caterServices![index]!.serviceImg.toString(),
                                    height: 140,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 7,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        child: Text(caterServices![index]!.artistName.toString(),style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis
                                        ),),
                                      ),
                                      const SizedBox(height: 3,),
                                      Text("\u{20B9}${caterServices![index]!.mrpPrice.toString()}",style: TextStyle(
                                          color:CustomColors.blackTemp.withOpacity(0.5)
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  Text("Shivay caters",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: CustomColors.blackTemp.withOpacity(0.5),
                                        overflow:TextOverflow.ellipsis
                                    ),),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen2()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:CustomColors.primaryColor,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/2,
                                        child: const Center(
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
                                    ),
                                  )


                                ],
                              ),
                            ),
                          );
                        }
                        else if(widget.categoryName == "Photographer"){
                          return   Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(photographerServices![index]!.serviceImg.toString(),
                                    height: 140,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 7,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        child: Text(photographerServices![index]!.artistName.toString(),style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis
                                        ),),
                                      ),
                                      const SizedBox(height: 3,),
                                      Text("\u{20B9}${photographerServices![index]!.mrpPrice.toString()}",style: TextStyle(
                                          color:CustomColors.blackTemp.withOpacity(0.5)
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/3.5,
                                    child: Text(photographerServices![index]!.serDesc.toString(),
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: CustomColors.blackTemp.withOpacity(0.5),
                                          overflow:TextOverflow.ellipsis
                                      ),),
                                  ),
                                  const SizedBox(height: 7,),
                                  Container(
                                      height: 45,
                                      width: double.infinity,
                                      color: Colors.grey.withOpacity(0.2),
                                      child: DropdownButtonFormField<String>(focusColor: Colors.transparent ,
                                        elevation: 2, hint: const Text('Select Hours',
                                          style: TextStyle(fontSize: 14),),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        value: selectedValues.length > index ? selectedValues[index] : null,
                                        items: dropdownValues.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(' $value',style: const TextStyle(fontSize: 14),),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            if (selectedValues.length <= index) {
                                              selectedValues.add(newValue!);
                                            } else {
                                              selectedValues[index] = newValue!;
                                            }
                                          });
                                        },
                                        decoration: const InputDecoration(),
                                      )
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleDateScreen()));

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:CustomColors.primaryColor,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        height: 30,
                                        width: MediaQuery.of(context).size.width/2,
                                        child:const  Center(
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
                                    ),
                                  )


                                ],
                              ),
                            ),
                          );
                        }
                        else{
                          return   Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(groceryServices![index]!.serviceImg.toString(),
                                    height: 140,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 7,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        child: Text(groceryServices![index]!.artistName.toString(),style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis
                                        ),),
                                      ),
                                      const  SizedBox(height: 3,),
                                      Text("\u{20B9}${groceryServices![index]!.mrpPrice.toString()*items![index]}",style: TextStyle(
                                          color:CustomColors.blackTemp.withOpacity(0.5)
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 7,),
                                  Text("puja samagri",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: CustomColors.blackTemp.withOpacity(0.5),
                                        overflow:TextOverflow.ellipsis
                                    ),),
                                  const SizedBox(height: 7,),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            setState(() {
                                              if(items![index]>1){
                                                setState(() {
                                                  items![index]= items![index]-item![index];
                                                });
                                              }

                                            });
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color:CustomColors.primaryColor,
                                                  borderRadius: BorderRadius.circular(3)
                                              ),

                                              child:const Icon(Icons.remove,color: Colors.white,size: 20,weight:900,)

                                          ),
                                        ),const SizedBox(width: 10,),
                                        Container(
                                          width: MediaQuery.of(context).size.width/9,
                                          height: 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.6),
                                              borderRadius: BorderRadius.circular(3)
                                          ),

                                          child: Text("${items![index]}",
                                            style: const TextStyle(fontSize: 13),),
                                        ),
                                        const SizedBox(width: 10,),
                                        GestureDetector(
                                          onTap:(){
                                            setState(() {
                                              items![index]=items![index]+item![index];
                                            });

                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color:CustomColors.primaryColor,
                                                  borderRadius: BorderRadius.circular(3)
                                              ),

                                              child:const Icon(Icons.add,color: Colors.white,size: 20,weight:900,)

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  const  SizedBox(height: 10,),
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
                                      width: MediaQuery.of(context).size.width/3.3,
                                      child: const Center(
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
                          );
                        }

                      }),
                )
              ],
            );
          }
          else{
            return const Center(child: Text("No Services"),);
          }
        }
         return const Center(child: Text("No Services"),);
        } );
  }
}
