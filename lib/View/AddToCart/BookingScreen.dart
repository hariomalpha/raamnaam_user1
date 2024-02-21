import 'package:flutter/material.dart';
import 'package:raamnaam/View/AddToCart/BookYourServices.dart';

import '../../Utils/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int section = 6;

  List<Map<String, dynamic>> bookingDetail = [
    {
      'section': '2',
      'image': 'assets/images/hawanpooja.jpg',
      'title': 'Hawan Poojan',
      'price': '900',
      'gst': '16%',
    },
    {
      'section': '5',
      'image': 'assets/images/grahpooja.jpg',
      'title': 'Grocery',
      'price': '900',
      'gst': '16%',
    },
    {
      'section': '1',
      'image': 'assets/images/weddingimage2.jpg',
      'title': 'Tent',
      'price': '900',
      'gst': '16%',
      'Hour': '31'
    },
    {
      'section': '3',
      'image': 'assets/images/weddingimage.jpg',
      'title': 'Wedding Photographer',
      'price': '900.00',
      'gst': '16%',
      'qty': '1'
    },
    {
      'section': '4',
      'image': 'assets/images/Bhikshaimage.jpg',
      'title': 'Caters',
      'chef price': '900',
      'gst': '16%',
      'helper price': '310',
      'helper no': '20',
      'chef no': '5'
    },
    {
      'section': '2',
      'image': 'assets/images/hawanpooja.jpg',
      'title': 'Hawan Poojan',
      'price': '900',
      'gst': '16%',
    },
    {
      'section': '5',
      'image': 'assets/images/grahpooja.jpg',
      'title': 'Grocery',
      'price': '900',
      'gst': '16%',
    },
    {
      'section': '1',
      'image': 'assets/images/weddingimage2.jpg',
      'title': 'Tent',
      'price': '900',
      'gst': '16%',
      'Hour': '31'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: CustomColors.whiteColor,
            )),
        backgroundColor: CustomColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2,
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  itemCount: bookingDetail.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (bookingDetail[index]["section"] == '1')
                        ? Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(9),
                                        child: Image.asset(
                                          bookingDetail[index]["image"],
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Text(
                                            bookingDetail[index]["title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            "Price: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Text(
                                            "\u{20B9}${bookingDetail[index]["price"]}",
                                            style: TextStyle(
                                                color: CustomColors.blackTemp
                                                    .withOpacity(0.5)),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            "GST(%): ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Text(
                                            "${bookingDetail[index]["gst"]}",
                                            style: TextStyle(
                                                color: CustomColors.blackTemp
                                                    .withOpacity(0.5)),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            "Hours: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Text(
                                            "${bookingDetail[index]["Hour"]} Hr",
                                            style: TextStyle(
                                                color: CustomColors.blackTemp
                                                    .withOpacity(0.5)),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : (bookingDetail[index]["section"] == '2')
                            ? Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width / 1.8,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: Image.asset(
                                              bookingDetail[index]["image"],
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Text(
                                                bookingDetail[index]["title"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(children: [
                                              Text(
                                                "Price: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              Text(
                                                "\u{20B9}${bookingDetail[index]["price"]}",
                                                style: TextStyle(
                                                    color: CustomColors
                                                        .blackTemp
                                                        .withOpacity(0.5)),
                                              ),
                                            ]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(children: [
                                              Text(
                                                "GST(%): ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              Text(
                                                "${bookingDetail[index]["gst"]}",
                                                style: TextStyle(
                                                    color: CustomColors
                                                        .blackTemp
                                                        .withOpacity(0.5)),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : (bookingDetail[index]["section"] == '3')
                                ? Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                child: Image.asset(
                                                  bookingDetail[index]["image"],
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 17,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Text(
                                                    bookingDetail[index]
                                                        ["title"],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(children: [
                                                  Text(
                                                    "Price: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  Text(
                                                    "\u{20B9}${bookingDetail[index]["price"]}",
                                                    style: TextStyle(
                                                        color: CustomColors
                                                            .blackTemp
                                                            .withOpacity(0.5)),
                                                  ),
                                                ]),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(children: [
                                                  Text(
                                                    "GST(%): ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  Text(
                                                    "${bookingDetail[index]["gst"]}",
                                                    style: TextStyle(
                                                        color: CustomColors
                                                            .blackTemp
                                                            .withOpacity(0.5)),
                                                  ),
                                                ]),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(children: [
                                                  Text(
                                                    "QTY: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  Text(
                                                    "${bookingDetail[index]["qty"]}",
                                                    style: TextStyle(
                                                        color: CustomColors
                                                            .blackTemp
                                                            .withOpacity(0.5)),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : (bookingDetail[index]["section"] == '4')
                                    ? Container(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9),
                                                      child: Image.asset(
                                                        bookingDetail[index]
                                                            ["image"],
                                                        height: 120,
                                                        width: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                SizedBox(
                                                  height: 17,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                        bookingDetail[index]
                                                            ["title"],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "Chef Price: ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "\u{20B9}${bookingDetail[index]["chef price"]}",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "Helper Price: ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "\u{20B9}${bookingDetail[index]["helper price"]}",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "GST(%): ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "${bookingDetail[index]["gst"]}",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "No. of Chef: ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "${bookingDetail[index]["helper no"]} Chef",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "No. of Helper: ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "${bookingDetail[index]["helper no"]} Helper",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                    child: Image.asset(
                                                      bookingDetail[index]
                                                          ["image"],
                                                      height: 120,
                                                      width: 120,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 17,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                        bookingDetail[index]
                                                            ["title"],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "Price: ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Text(
                                                        "\u{20B9}${bookingDetail[index]["price"]}",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        "GST(%): ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      Text(
                                                        "${bookingDetail[index]["gst"]}",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .blackTemp
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                  }),
            ),
            // InkWell(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>BookServices()));
            //
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color:CustomColors.primaryColor,
            //         borderRadius: BorderRadius.circular(3)
            //     ),
            //     height: 50,
            //     width: MediaQuery.of(context).size.width/1.2,
            //     child: Center(
            //       child: Text(
            //         "Book",
            //         style:  TextStyle(
            //           color:CustomColors.whiteColor,
            //           fontSize: 17,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookServices()));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CustomColors.primaryColor,
            // borderRadius: BorderRadius.circular(3)
          ),
          height: 55,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Center(
            child: Text(
              "Book",
              style: TextStyle(
                color: CustomColors.whiteColor,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
