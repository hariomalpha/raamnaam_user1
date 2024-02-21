import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:raamnaam/Model/cart_model.dart';
import 'package:raamnaam/Model/service_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/colors.dart';
import 'BookingScreen.dart';

class ServiceCart extends StatefulWidget {
  const ServiceCart({super.key});

  @override
  State<ServiceCart> createState() => _ServiceCartState();
}

class _ServiceCartState extends State<ServiceCart> {
  // List cartValueList = [
  //   {
  //     "name": "Wedding Photographer",
  //     "img": "assets/images/wedding1.jpg",
  //     "price": '18600',
  //     "gst": "16%",
  //     "finalPrice": "21576"
  //   },
  //   {
  //     "name": "Ashlesha Bali",
  //     "img": "assets/images/Homewelcome.jpg",
  //     "price": '2500',
  //     "gst": "17%",
  //     "finalPrice": "2925"
  //   },
  //   {
  //     "name": "Bhoj Caters",
  //     "img": "assets/images/Bhikshaimage.jpg",
  //     "price": '0',
  //     "gst": "16%",
  //     "finalPrice": "0"
  //   },
  //   {
  //     "name": "Indian Dhooti",
  //     "img": "assets/images/grahpooja.jpg",
  //     "price": '900',
  //     "gst": "11%",
  //     "finalPrice": "999"
  //   },
  //   {
  //     "name": "Pagoda Tent",
  //     "img": "assets/images/weddingimage2.jpg",
  //     "price": '4000',
  //     "gst": "18%",
  //     "finalPrice": "4720"
  //   },
  // ];

  List<CartModel> cartValue = [];

  Future<List<CartModel>?> get_categoryApi() async {
    try {
      var headers = {
        'Cookie': 'ci_session=848ebe35b90239b9ea4db1c35a5411d07bc959f5'
      };

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String? userId = await prefs.getString('userId');
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://developmentalphawizz.com/ramnaam/api/get_cart_items'));
      request.fields.addAll({'user_id': userId ?? "2"});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        final data = json.decode(result);
        List<CartModel> list = data['message'] == "Cart is Empty"
            ? []
            : data['cart']
                .map<CartModel>((i) => CartModel.fromJson(i))
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

  List<CartModel> saveLaterList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primaryColor,
          centerTitle: true,
          title: Text("Sevice Cart"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: get_categoryApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == null) {
                   return Text('no data found');
                  }
                  cartValue = [];
                  cartValue.addAll(snapshot.data!);
                  return Container(
                    height: saveLaterList.length == 0
                        ? MediaQuery.of(context).size.height * 0.85
                        : MediaQuery.of(context).size.height * 0.55,
                    child: snapshot.data!.length == 0
                        ? Center(
                            child: Text('No Cart Value'),
                          )
                        : ListView.builder(
                            itemCount: cartValue.length,
                            itemBuilder: (context, index) {
                              return cartCard(
                                  obj: cartValue[index],
                                  isSaveForLater: false,
                                  index: index);
                            },
                          ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        bottomSheet: saveLaterList.length == 0
            ? Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingScreen()));
                  },
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                            color: CustomColors.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 16, color: CustomColors.whiteColor),
                        )),
                  ),
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.42,
                child: Column(
                  children: [
                    saveLaterList.length == 0
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Save For Later',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                    saveLaterList.length == 0
                        ? Container()
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            child: saveLaterList.length == 0
                                ? Center(
                                    child: Text('No Save For Later'),
                                  )
                                : ListView.builder(
                                    itemCount: saveLaterList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          child: cartCard(
                                              obj: saveLaterList[index],
                                              isSaveForLater: true,
                                              index: index));
                                    },
                                  ),
                          ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingScreen()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: 180,
                          height: 45,
                          decoration: BoxDecoration(
                              color: CustomColors.primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 16, color: CustomColors.whiteColor),
                          )),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget cartCard(
      {required CartModel obj,
      required bool isSaveForLater,
      required int index}) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.9,
        // decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(right: 5, top: 5),
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.topRight,
              child: Icon(Icons.delete_outline_outlined),
            ),
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Image.network(
                              '${obj.productImage}',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Service Name: ${obj.productName}"),
                                Text("Price: ${obj.price}"),
                                Text("GST(%): ${obj.gst}%"),
                                Text("Final Price: ${obj.fPrice}"),
                                // Container(
                                //   padding: EdgeInsets.only(right: 10),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [

                                //       Container(
                                //         color: Colors.brown.shade100,
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: 20, vertical: 10),
                                //         child: Text("Delete"),
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (isSaveForLater) {
                          saveLaterList.removeAt(index);
                          setState(() {
                            cartValue.add(obj);
                          });
                        } else {
                          cartValue.removeAt(index);
                          setState(() {
                            saveLaterList.add(obj);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF8F0202),
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          isSaveForLater ? "Move to Cart" : "Save For Later",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
