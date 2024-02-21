import 'package:flutter/material.dart';
import 'package:raamnaam/Utils/colors.dart';
import 'package:raamnaam/View/AddToCart/BookingDetail.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  List bookingList = [
    {
      "id": "#115",
      "Sdate": "2023-08-31",
      "total": '2925.00',
      "Bdate": "2023-08-31",
      "Btime": "13.52",
      "Address": "Indore MP",
      "BStatus": "Pending"
    },
    {
      "id": "#115",
      "Sdate": "2023-08-31",
      "total": '2925.00',
      "Bdate": "2023-08-31",
      "Btime": "13.52",
      "Address": "Indore MP",
      "BStatus": "Accepted"
    },
    {
      "id": "#115",
      "Sdate": "2023-08-31",
      "total": '2925.00',
      "Bdate": "2023-08-31",
      "Btime": "13.52",
      "Address": "Indore MP",
      "BStatus": "Cancelled"
    },
    {
      "id": "#115",
      "Sdate": "2023-08-31",
      "total": '2925.00',
      "Bdate": "2023-08-31",
      "Btime": "13.52",
      "Address": "Indore MP",
      "BStatus": "Pending"
    },
    {
      "id": "#115",
      "Sdate": "2023-08-31",
      "total": '2925.00',
      "Bdate": "2023-08-31",
      "Btime": "13.52",
      "Address": "Indore MP",
      "BStatus": "Pending"
    },
  ];

  List saveLaterList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8F0202),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'My Booking',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView.builder(
                itemCount: bookingList.length,
                itemBuilder: (context, index) {
                  return bookingCard(obj: bookingList[index], index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingCard({required dynamic obj, required int index}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        // decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                            const   Expanded(
                                  child: Text(
                                    "Booking Id :",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            const   SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text(obj['id'])),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                    "Shedule Date :",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text(obj['Sdate'])),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                    "Booking Date :",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text(obj['Bdate'])),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                    "Booking Time :",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                             const  SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text(obj['Btime'])),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                    "Address :",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                             const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text(obj['Address'])),
                            ],
                          ),
                          Row(
                            children: [
                            const  Expanded(
                                  child: Text(
                                    "Total :",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                             const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text("\u{20B9} ${obj['total']}")),
                            ],
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Booking status",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Text(
                                  "${obj['BStatus']}" ,
                                    style:  TextStyle(
                                      color: obj['BStatus'] == "Pending" ?
                                      Colors.blue:obj['BStatus'] == "Accepted" ?
                                      Colors.green:Colors.red
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingDetail(
                                      obj: obj,
                                    )),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:CustomColors.primaryColor,
                              ),
                              padding:const  EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: const Center(
                                child: Text(
                                  "View Booking",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                // Expanded(flex: 2, child: Container())
              ],
            ),
          ],
        ),
      ),
    );
  }
}


