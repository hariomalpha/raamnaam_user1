import 'package:flutter/material.dart';

class BookingDetail extends StatefulWidget {
  final dynamic obj;
  const BookingDetail({Key? key, this.obj}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8F0202),
          elevation: 0,
          title: Text(
            'Booking Details',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Booking Details',
                style: TextStyle(fontSize: 18, color: Color(0xFF8F0202)),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Booking Id",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(widget.obj['id']),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Booking Date :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(widget.obj['Bdate']),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Booking status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Pending',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Order Details',
                style: TextStyle(fontSize: 18, color: Color(0xFF8F0202)),
              ),
              SizedBox(
                height: 10,
              ),
              cartCard(),
              SizedBox(
                height: 30,
              ),
              Text(
                'Payment Method',
                style: TextStyle(fontSize: 18, color: Color(0xFF8F0202)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF8F0202),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Payment Method",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text("COD")),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Total :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Text("\u{20B9} ${widget.obj['total']}"

                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Addresss :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text(widget.obj['Address'])),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Mobile :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text("7417417417")),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Booking Date :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text(widget.obj['Bdate'])),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Booking Time :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text(widget.obj['Btime'])),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cartCard() {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.9,
        // decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            padding: EdgeInsets.only(top: 10),
                            child: Image(
                              image: AssetImage('assets/images/wedding1.jpg'),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Expanded(
                          flex: 2,   
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  Expanded(child: Text('Wedding')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Price :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(child: Text('\u{20B9} 900.00')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "GST Price :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(child: Text('\u{20B9} 99.00')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(child: Text('\u{20B9} 999.00')),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}