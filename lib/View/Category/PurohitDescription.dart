import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raamnaam/Model/service_detail_model.dart';
import 'package:raamnaam/Model/service_model.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:http/http.dart' as http;
import 'ScheduleDateScreen.dart';

class PurohitDescription extends StatefulWidget {
  const PurohitDescription(
      {Key? key, this.image, this.price, this.product_name, this.des, this.id,this.serviceValue})
      : super(key: key);
  final String? image, price, product_name, des, id;
  final ServiceModel? serviceValue;

  @override
  State<PurohitDescription> createState() => _PurohitDescriptionState();
}

class _PurohitDescriptionState extends State<PurohitDescription> {
  bool service = true;

  Future<List<ServiceDetails>?> get_Details(
      {required String planType, required String serviceType}) async {
    try {
      print(planType);
      var headers = {
        'Cookie': 'ci_session=4ef368c1717cc476d45cb3e12ebd47d9266f11fd'
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://developmentalphawizz.com/ramnaam/api/get_services_plans'));
      request.fields.addAll({'service_id': serviceType, 'plan_type': planType});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        final data = json.decode(result);
        List<ServiceDetails> list = data['data']
            .map<ServiceDetails>((i) => ServiceDetails.fromJson(i))
            .toList();
        return list;
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        widget.serviceValue!.serviceImg.toString(),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 12),
                          Text(
                            widget.serviceValue!.artistName.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: CustomColors.primaryColor),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Service Range :- \u{20B9} ${widget.serviceValue!.specialPrice}.00 - \u{20B9} ${widget.serviceValue!.lastPrice}.00/-",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              widget.serviceValue!.serDesc??"this is description",
                              style: const TextStyle(
                                  fontSize: 13,)),
                          const SizedBox(height: 10),

                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                // alignment: Alignment.centerLeft,
                // margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox( width:21),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          service = !service;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (service)
                            ? CustomColors.primaryColor
                            : CustomColors.whiteColor,
                        side: const BorderSide(
                          width: 0.5,
                          color: CustomColors.primaryColor,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                      ),
                      child: Container(
                        width: 110,
                        alignment: Alignment.center,
                        child: Text("Residence",
                            style: TextStyle(
                                fontSize: 14,
                                color: (!service)
                                    ? CustomColors.primaryColor
                                    : CustomColors.whiteColor)),
                      ),
                    ),

                    const SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          service = !service;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: (!service)
                              ? CustomColors.primaryColor
                              : CustomColors.whiteColor,
                          side: const BorderSide(
                            width: 0.5,
                            color: CustomColors.primaryColor,
                          ),
                          shape:const  RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30)))),
                      child: Container(
                        width: 110,
                        alignment: Alignment.center,
                        child: Text("Commercial",
                            style: TextStyle(
                                fontSize: 14,
                                color: (service)
                                    ? CustomColors.primaryColor
                                    : CustomColors.whiteColor)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select your package",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: CustomColors.primaryColor),
              ),

              FutureBuilder(
                future: get_Details(
                    planType: service ? "residence" : "commercial",
                    serviceType: widget.id ?? ''),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (snapshot.hasData) {
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No Package Found'));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Container(
                                          margin: EdgeInsets.only(left: 16),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${snapshot.data![index].planType} Plan : (${snapshot.data![index].title})",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Text(
                                                "\u2022",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${snapshot.data![index].noOfPerson} person",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Text(
                                                "\u2022",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data![index]
                                                            .poojaSamagri ==
                                                        "0"
                                                    ? "Without Pooja Samagri"
                                                    : "With Pooja Samagri",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Text(
                                                "\u2022",
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data![index]
                                                            .fruitFlower ==
                                                        "0"
                                                    ? "With Fruit And Flowers"
                                                    : "Without Fruit And Flowers",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              snapshot.data![index]
                                                      .description ??
                                                  "Note :Procedure involved: • Ganapathi pooja • Punyaha Vachanam & Sankalpam • Kalasa Pooja • Mantapa Aradhana • Ashlesha Bali • Homa • Asheervachana Note: Pooja Samagries like Arshina, Kum kum ,Coconuts, Mango leaves, Tulasi, Darba, Kalasha, Vastra, Navadhanya, Jackets, Beetle Leaves, Beetle Nuts, Homa Sticks, samidha, Dravyas, Ghee etc. will be brought by us. Yajamani have to keep house items like Gas stove, Vessels, Deepa, Mats, Bowls, Milk, Curd, Prasada, Plates, Photos etc you will be receiving detailed to do list after booking.",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              maxLines: 3),
                                        ),
                                        SizedBox(height: 20),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Rs ${snapshot.data![index].price}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScheduleDateScreen()));

                                            setState(() {});
                                          },
                                          child: Container(
                                              width: 110,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Select",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: CustomColors
                                                        .whiteColor),
                                              )),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CustomColors.greenColor,
                                            side: const BorderSide(
                                              width: 0.5,
                                              color: CustomColors.greenColor,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    // return Column(
                    //   children: [

                    //     Padding(
                    //       padding: const EdgeInsets.all(15),
                    //       child: Card(
                    //         elevation: 4,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(12)),
                    //         child: Container(
                    //           padding: const EdgeInsets.all(10),
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 alignment: Alignment.centerLeft,
                    //                 width:
                    //                     MediaQuery.of(context).size.width,
                    //                 child: Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: [
                    //                     SizedBox(height: 10),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 16),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(
                    //                         "Standard Plan : (${widget.product_name})",
                    //                         style: TextStyle(
                    //                           fontWeight: FontWeight.w500,
                    //                           fontSize: 16,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 6),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(
                    //                         children: [
                    //                           Text(
                    //                             "\u2022",
                    //                             style:
                    //                                 TextStyle(fontSize: 25),
                    //                           ),
                    //                           SizedBox(
                    //                             width: 10,
                    //                           ),
                    //                           Text(
                    //                             "18 person",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 overflow: TextOverflow
                    //                                     .ellipsis),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(
                    //                         children: [
                    //                           Text(
                    //                             "\u2022",
                    //                             style:
                    //                                 TextStyle(fontSize: 25),
                    //                           ),
                    //                           SizedBox(
                    //                             width: 10,
                    //                           ),
                    //                           Text(
                    //                             "Without Pooja Samagri",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 overflow: TextOverflow
                    //                                     .ellipsis),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(
                    //                         children: [
                    //                           Text(
                    //                             "\u2022",
                    //                             style:
                    //                                 TextStyle(fontSize: 25),
                    //                           ),
                    //                           SizedBox(
                    //                             width: 10,
                    //                           ),
                    //                           Text(
                    //                             "Without Fruit And Flowers",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 overflow: TextOverflow
                    //                                     .ellipsis),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 10),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(
                    //                           "Note:• Ganapathi pooja • Punyaha Vachanam & Sankalpam • Kalasha Pooja • Mantapa Aradhana • Ashlesha Bali • Sarpa Sukta Japam • Homa • Asheervachana Note: Pooja Samagries like Arshina, Kum kum ,Coconuts, Mango leaves, Tulasi, Darba, Kalasha, Vastra, Navadhanya, Jackets, Beetle Leaves, Beetle Nuts, Homa Sticks, samidha, Dravyas, Ghee etc. will be brought by us. Yajamani have to keep house items like Gas stove, Vessels, Deepa, Mats, Bowls, Milk, Curd, Prasada, Plates, Photos etc you will be receiving detailed to do list after booking.",
                    //                           style: TextStyle(
                    //                               fontSize: 13,
                    //                               overflow: TextOverflow
                    //                                   .ellipsis),
                    //                           maxLines: 3),
                    //                     ),
                    //                     SizedBox(height: 20),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.center,
                    //                       child: Text(
                    //                         "Rs 3000.00",
                    //                         style: TextStyle(
                    //                             fontWeight: FontWeight.w500,
                    //                             fontSize: 15,
                    //                             overflow:
                    //                                 TextOverflow.ellipsis),
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 5),
                    //                     ElevatedButton(
                    //                       onPressed: () {
                    //                         Navigator.push(
                    //                             context,
                    //                             MaterialPageRoute(
                    //                                 builder: (context) =>
                    //                                     ScheduleDateScreen()));

                    //                         setState(() {});
                    //                       },
                    //                       child: Container(
                    //                           width: 110,
                    //                           alignment: Alignment.center,
                    //                           child: Text(
                    //                             "Select",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 color: CustomColors
                    //                                     .whiteColor),
                    //                           )),
                    //                       style: ElevatedButton.styleFrom(
                    //                         backgroundColor:
                    //                             CustomColors.greenColor,
                    //                         side: const BorderSide(
                    //                           width: 0.5,
                    //                           color:
                    //                               CustomColors.greenColor,
                    //                         ),
                    //                         shape: RoundedRectangleBorder(
                    //                           borderRadius:
                    //                               BorderRadius.all(
                    //                             Radius.circular(30),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(15),
                    //       child: Card(
                    //         elevation: 4,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(12)),
                    //         child: Container(
                    //           padding: const EdgeInsets.all(10),
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 alignment: Alignment.centerLeft,
                    //                 width:
                    //                     MediaQuery.of(context).size.width,
                    //                 child: Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: [
                    //                     SizedBox(height: 10),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 16),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(
                    //                         "Premium Plan : (${widget.product_name})",
                    //                         style: TextStyle(
                    //                           fontWeight: FontWeight.w500,
                    //                           fontSize: 16,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 6),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(
                    //                         children: [
                    //                           Text(
                    //                             "\u2022",
                    //                             style:
                    //                                 TextStyle(fontSize: 25),
                    //                           ),
                    //                           SizedBox(
                    //                             width: 10,
                    //                           ),
                    //                           Text(
                    //                             "20 person",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 overflow: TextOverflow
                    //                                     .ellipsis),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(
                    //                         children: [
                    //                           Text(
                    //                             "\u2022",
                    //                             style:
                    //                                 TextStyle(fontSize: 25),
                    //                           ),
                    //                           SizedBox(
                    //                             width: 10,
                    //                           ),
                    //                           Text(
                    //                             "With Pooja Samagri",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 overflow: TextOverflow
                    //                                     .ellipsis),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Row(
                    //                         children: [
                    //                           Text(
                    //                             "\u2022",
                    //                             style:
                    //                                 TextStyle(fontSize: 25),
                    //                           ),
                    //                           SizedBox(
                    //                             width: 10,
                    //                           ),
                    //                           Text(
                    //                             "With Fruit And Flowers",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 overflow: TextOverflow
                    //                                     .ellipsis),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 10),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.centerLeft,
                    //                       child: Text(
                    //                           "Note :Ganapathi pooja • Punyaha Vachanam & Sankalpam • Kalasha Pooja • Mantapa Aradhana • Ashlesha Bali • Sarpa Sukta Japam • Homa • Asheervachana Note: Pooja Samagries like Arshina, Kum kum ,Coconuts, Mango leaves, Tulasi, Darba, Kalasha, Vastra, Navadhanya, Jackets, Beetle Leaves, Beetle Nuts, Homa Sticks, samidha, Dravyas, Ghee etc. will be brought by us. Yajamani have to keep house items like Gas stove, Vessels, Deepa, Mats, Bowls, Milk, Curd, Prasada, Plates, Photos etc you will be receiving detailed to do list after booking.",
                    //                           style: TextStyle(
                    //                               fontSize: 13,
                    //                               overflow: TextOverflow
                    //                                   .ellipsis),
                    //                           maxLines: 3),
                    //                     ),
                    //                     SizedBox(height: 20),
                    //                     Container(
                    //                       margin: EdgeInsets.only(left: 15),
                    //                       alignment: Alignment.center,
                    //                       child: Text(
                    //                         "Rs 4000.00",
                    //                         style: TextStyle(
                    //                             fontWeight: FontWeight.w500,
                    //                             fontSize: 15,
                    //                             overflow:
                    //                                 TextOverflow.ellipsis),
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 5),
                    //                     ElevatedButton(
                    //                       onPressed: () {
                    //                         Navigator.push(
                    //                             context,
                    //                             MaterialPageRoute(
                    //                                 builder: (context) =>
                    //                                     ScheduleDateScreen()));

                    //                         setState(() {});
                    //                       },
                    //                       child: Container(
                    //                           width: 110,
                    //                           alignment: Alignment.center,
                    //                           child: Text(
                    //                             "Select",
                    //                             style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 color: CustomColors
                    //                                     .whiteColor),
                    //                           )),
                    //                       style: ElevatedButton.styleFrom(
                    //                         backgroundColor:
                    //                             CustomColors.greenColor,
                    //                         side: const BorderSide(
                    //                           width: 0.5,
                    //                           color:
                    //                               CustomColors.greenColor,
                    //                         ),
                    //                         shape: RoundedRectangleBorder(
                    //                           borderRadius:
                    //                               BorderRadius.all(
                    //                             Radius.circular(30),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // );
                  }
                  else if(snapshot.hasError) {
                    return const Center(child: Text("Something Went Wrong!!"),);
                  }
                  else{
                    return const SizedBox.shrink();
                  }
                },
              )
              // : Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(15),
              //         child: Card(
              //           elevation: 4,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(12)),
              //           child: Container(
              //             padding: const EdgeInsets.all(10),
              //             child: Column(
              //               children: [
              //                 Container(
              //                   alignment: Alignment.centerLeft,
              //                   width: MediaQuery.of(context).size.width,
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       SizedBox(height: 10),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 16),
              //                         alignment: Alignment.centerLeft,
              //                         child: Text(
              //                           "Economy Plan : (${widget.product_name})",
              //                           style: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 16,
              //                           ),
              //                         ),
              //                       ),
              //                       SizedBox(height: 6),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "5 person",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "With Pooja Samagri",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "Without Fruit And Flowers",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(height: 10),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Text(
              //                             "Note :Procedure involved: • Ganapathi pooja • Punyaha Vachanam & Sankalpam • Kalasa Pooja • Mantapa Aradhana • Ashlesha Bali • Homa • Asheervachana Note: Pooja Samagries like Arshina, Kum kum ,Coconuts, Mango leaves, Tulasi, Darba, Kalasha, Vastra, Navadhanya, Jackets, Beetle Leaves, Beetle Nuts, Homa Sticks, samidha, Dravyas, Ghee etc. will be brought by us. Yajamani have to keep house items like Gas stove, Vessels, Deepa, Mats, Bowls, Milk, Curd, Prasada, Plates, Photos etc you will be receiving detailed to do list after booking.",
              //                             style: TextStyle(
              //                                 fontSize: 13,
              //                                 overflow:
              //                                     TextOverflow.ellipsis),
              //                             maxLines: 3),
              //                       ),
              //                       SizedBox(height: 20),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.center,
              //                         child: Text(
              //                           "Rs 1500.00",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.w500,
              //                               fontSize: 15,
              //                               overflow: TextOverflow.ellipsis),
              //                         ),
              //                       ),
              //                       SizedBox(height: 5),
              //                       ElevatedButton(
              //                         onPressed: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       ScheduleDateScreen()));

              //                           setState(() {});
              //                         },
              //                         child: Container(
              //                             width: 110,
              //                             alignment: Alignment.center,
              //                             child: Text(
              //                               "Select",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   color:
              //                                       CustomColors.whiteColor),
              //                             )),
              //                         style: ElevatedButton.styleFrom(
              //                           backgroundColor:
              //                               CustomColors.greenColor,
              //                           side: const BorderSide(
              //                             width: 0.5,
              //                             color: CustomColors.greenColor,
              //                           ),
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.all(
              //                               Radius.circular(30),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(15),
              //         child: Card(
              //           elevation: 4,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(12)),
              //           child: Container(
              //             padding: const EdgeInsets.all(10),
              //             child: Column(
              //               children: [
              //                 Container(
              //                   alignment: Alignment.centerLeft,
              //                   width: MediaQuery.of(context).size.width,
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       SizedBox(height: 10),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 16),
              //                         alignment: Alignment.centerLeft,
              //                         child: Text(
              //                           "Standard Plan : (${widget.product_name})",
              //                           style: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 16,
              //                           ),
              //                         ),
              //                       ),
              //                       SizedBox(height: 6),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "10 person",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "With Pooja Samagri",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "Without Fruit And Flowers",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(height: 10),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Text(
              //                             "Note:• Ganapathi pooja • Punyaha Vachanam & Sankalpam • Kalasha Pooja • Mantapa Aradhana • Ashlesha Bali • Sarpa Sukta Japam • Homa • Asheervachana Note: Pooja Samagries like Arshina, Kum kum ,Coconuts, Mango leaves, Tulasi, Darba, Kalasha, Vastra, Navadhanya, Jackets, Beetle Leaves, Beetle Nuts, Homa Sticks, samidha, Dravyas, Ghee etc. will be brought by us. Yajamani have to keep house items like Gas stove, Vessels, Deepa, Mats, Bowls, Milk, Curd, Prasada, Plates, Photos etc you will be receiving detailed to do list after booking.",
              //                             style: TextStyle(
              //                                 fontSize: 13,
              //                                 overflow:
              //                                     TextOverflow.ellipsis),
              //                             maxLines: 3),
              //                       ),
              //                       SizedBox(height: 20),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.center,
              //                         child: Text(
              //                           "Rs 2000.00",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.w500,
              //                               fontSize: 15,
              //                               overflow: TextOverflow.ellipsis),
              //                         ),
              //                       ),
              //                       SizedBox(height: 5),
              //                       ElevatedButton(
              //                         onPressed: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       ScheduleDateScreen()));

              //                           setState(() {});
              //                         },
              //                         child: Container(
              //                             width: 110,
              //                             alignment: Alignment.center,
              //                             child: Text(
              //                               "Select",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   color:
              //                                       CustomColors.whiteColor),
              //                             )),
              //                         style: ElevatedButton.styleFrom(
              //                           backgroundColor:
              //                               CustomColors.greenColor,
              //                           side: const BorderSide(
              //                             width: 0.5,
              //                             color: CustomColors.greenColor,
              //                           ),
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.all(
              //                               Radius.circular(30),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(15),
              //         child: Card(
              //           elevation: 4,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(12)),
              //           child: Container(
              //             padding: const EdgeInsets.all(10),
              //             child: Column(
              //               children: [
              //                 Container(
              //                   alignment: Alignment.centerLeft,
              //                   width: MediaQuery.of(context).size.width,
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       SizedBox(height: 10),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 16),
              //                         alignment: Alignment.centerLeft,
              //                         child: Text(
              //                           "Premium Plan : (${widget.product_name})",
              //                           style: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 16,
              //                           ),
              //                         ),
              //                       ),
              //                       SizedBox(height: 6),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "15 person",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "With Pooja Samagri",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Row(
              //                           children: [
              //                             Text(
              //                               "\u2022",
              //                               style: TextStyle(fontSize: 25),
              //                             ),
              //                             SizedBox(
              //                               width: 10,
              //                             ),
              //                             Text(
              //                               "With Fruit And Flowers",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   overflow:
              //                                       TextOverflow.ellipsis),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(height: 10),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.centerLeft,
              //                         child: Text(
              //                             "Note :Ganapathi pooja • Punyaha Vachanam & Sankalpam • Kalasha Pooja • Mantapa Aradhana • Ashlesha Bali • Sarpa Sukta Japam • Homa • Asheervachana Note: Pooja Samagries like Arshina, Kum kum ,Coconuts, Mango leaves, Tulasi, Darba, Kalasha, Vastra, Navadhanya, Jackets, Beetle Leaves, Beetle Nuts, Homa Sticks, samidha, Dravyas, Ghee etc. will be brought by us. Yajamani have to keep house items like Gas stove, Vessels, Deepa, Mats, Bowls, Milk, Curd, Prasada, Plates, Photos etc you will be receiving detailed to do list after booking.",
              //                             style: TextStyle(
              //                                 fontSize: 13,
              //                                 overflow:
              //                                     TextOverflow.ellipsis),
              //                             maxLines: 3),
              //                       ),
              //                       SizedBox(height: 20),
              //                       Container(
              //                         margin: EdgeInsets.only(left: 15),
              //                         alignment: Alignment.center,
              //                         child: Text(
              //                           "Rs 2500.00",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.w500,
              //                               fontSize: 15,
              //                               overflow: TextOverflow.ellipsis),
              //                         ),
              //                       ),
              //                       SizedBox(height: 5),
              //                       ElevatedButton(
              //                         onPressed: () {
              //                           setState(() {});
              //                         },
              //                         child: Container(
              //                             width: 110,
              //                             alignment: Alignment.center,
              //                             child: Text(
              //                               "Select",
              //                               style: TextStyle(
              //                                   fontSize: 14,
              //                                   color:
              //                                       CustomColors.whiteColor),
              //                             )),
              //                         style: ElevatedButton.styleFrom(
              //                           backgroundColor:
              //                               CustomColors.greenColor,
              //                           side: const BorderSide(
              //                             width: 0.5,
              //                             color: CustomColors.greenColor,
              //                           ),
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.all(
              //                               Radius.circular(30),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
