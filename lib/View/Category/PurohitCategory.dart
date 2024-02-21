import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raamnaam/Helper/apiStrings.dart';
import 'package:raamnaam/View/Category/PurohitDescription.dart';
import 'package:http/http.dart' as http;
import '../../Model/service_model.dart';
import '../../Utils/colors.dart';

class PurohitCategory extends StatefulWidget {
  const PurohitCategory({Key? key}) : super(key: key);

  @override
  State<PurohitCategory> createState() => _PurohitCategoryState();
}



class _PurohitCategoryState extends State<PurohitCategory> {
  @override
  void initState() {
    // TODO: implement initState
    // get_categoryApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text("Purohit Service"),
      ),
      body: SingleChildScrollView(
        child: 
        Column(
          children: [
            Container(
                // height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(10),
                child: FutureBuilder(
                  future: getService(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == null) {
                        return const Text('no data found');
                      }
                      return GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 220,
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 10.0, // spacing between rows
                          crossAxisSpacing: 8.0, // spacing between columns
                        ),
                        padding: EdgeInsets.all(8.0), // padding around the grid
                        itemCount:
                            snapshot.data!.length, // total number of items
                        itemBuilder: (context, index) {
                          // if(snapshot.data?[index].plans == "6")
                          return 
              
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PurohitDescription(
                                        serviceValue: snapshot.data![index] ,
                                            des: snapshot.data![index].serDesc,
                                            price: snapshot.data![index]
                                                    .specialPrice ??
                                                '',
                                                id: snapshot.data![index].id,
                                            image: snapshot
                                                    .data![index].serviceImg ??
                                                "assets/images/panditjiImage.png",
                                            product_name: snapshot
                                                    .data![index].artistName ??
                                                '',
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.8,
                                margin:const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      snapshot.data![index].serviceImg ??
                                          "assets/images/panditjiImage.png",
                                      height: 140,
                                      width:
                                          MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Name : '),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.5,
                                          child: Text(
                                            snapshot.data![index].artistName ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        // Text(
                                        //   "\u{20B9}${snapshot.data![index].specialPrice ?? ''}",
                                        //   style: TextStyle(
                                        //       color: CustomColors.blackTemp
                                        //           .withOpacity(0.5)),
                                        // ),
                                      ],
                                    ),
                                    Row(
                                     mainAxisAlignment:MainAxisAlignment.start,
                                      children: [
                                        const Text("Price : "),
                                        Text(
                                          "\u{20B9}${snapshot.data![index].specialPrice ?? ''}",
                                          style: TextStyle(
                                              color: CustomColors.blackTemp
                                                  .withOpacity(0.8)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  
  Future<List<ServiceModel>?>
  getService() async {
  try {
    var headers = {
      'Cookie': 'ci_session=b67852e1ecfd59613ddd97d2762188a2be402e1f'
    };
    var request = http.MultipartRequest(
        'POST',
        getAllServices);
    request.fields.addAll({
  'roll_id': '7'
});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final data = json.decode(result);
      List<ServiceModel> list = data['products']
          .map<ServiceModel>((i) => ServiceModel.fromJson(i))
          .toList();
     list.removeWhere((element) => element.plans != '6');
      return list;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  } catch (e) {
    print(e);
  }
}
}
