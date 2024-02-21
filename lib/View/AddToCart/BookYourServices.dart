import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raamnaam/Utils/colors.dart';

import '../../Home/homeScreen.dart';

class BookServices extends StatefulWidget {
  const BookServices({Key? key}) : super(key: key);

  @override
  State<BookServices> createState() => _BookServicesState();
}

class _BookServicesState extends State<BookServices> {
  bool service = true;
  String? selectedDate;
  bool currentSch = true;
  int _value = 1;
  bool isCash = false;
  TextEditingController dateCal = TextEditingController();
  TextEditingController timeCont = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Your Service"),
        backgroundColor: CustomColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                          currentSch = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Current booking",
                            style: TextStyle(
                                fontSize: 14,
                                color: (!service)
                                    ? CustomColors.primaryColor
                                    : CustomColors.whiteColor)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (service)
                            ? CustomColors.primaryColor
                            : CustomColors.whiteColor,
                        side: const BorderSide(
                          width: 0.5,
                          color: CustomColors.primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                      ),
                    ),

                    SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          service = !service;
                          currentSch = false;
                        });
                      },
                      child: Container(
                        width: 110,
                        alignment: Alignment.center,
                        child: Text("Schehule",
                            style: TextStyle(
                                fontSize: 14,
                                color: (service)
                                    ? CustomColors.primaryColor
                                    : CustomColors.whiteColor)),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: (!service)
                              ? CustomColors.primaryColor
                              : CustomColors.whiteColor,
                          side: const BorderSide(
                            width: 0.5,
                            color: CustomColors.primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30)))),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      (!currentSch)
                          ? Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 135,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: dateCal,

                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Booking Date is required';
                                        }
                                        return null;
                                      },
                                      // onTap:
                                      //     () async{
                                      //   DateTime? datePicked = await showDatePicker(
                                      //       context: context,
                                      //       initialDate: DateTime.now(),
                                      //       firstDate: DateTime(2000),
                                      //       lastDate: DateTime(2024));
                                      //   if (datePicked != null) {
                                      //     print(
                                      //         'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                      //     String formettedDate =
                                      //     DateFormat('dd-MM-yyyy').format(datePicked);
                                      //     setState(() {
                                      //       selectedDate = formettedDate;
                                      //       dateCal.text= formettedDate;
                                      //     });
                                      //   }
                                      // },

                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: CustomColors.grayColor
                                                    .withOpacity(0.6)),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          fillColor: CustomColors.grayColor
                                              .withOpacity(0.15),
                                          filled: true,
                                          hintText: "dd-mm-yyyy",
                                          hintStyle: TextStyle(fontSize: 12),
                                          suffixIcon: GestureDetector(
                                              onTap: () async {
                                                DateTime? datePicked =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime(2053));
                                                if (datePicked != null) {
                                                  print(
                                                      'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                                  String formettedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(datePicked);
                                                  setState(() {
                                                    selectedDate =
                                                        formettedDate;
                                                    dateCal.text =
                                                        formettedDate;
                                                  });
                                                }
                                              },
                                              child:
                                                  Icon(Icons.calendar_month))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 135,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: timeCont,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Booking time is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: CustomColors.grayColor
                                                    .withOpacity(0.6)),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          fillColor: CustomColors.grayColor
                                              .withOpacity(0.15),
                                          filled: true,
                                          hintText: "HH-mm-ss",
                                          hintStyle: TextStyle(fontSize: 12),
                                          suffixIcon: GestureDetector(
                                              onTap: () async {
                                                TimeOfDay? pickedTime =
                                                    await showTimePicker(
                                                  initialTime: TimeOfDay.now(),
                                                  context: context,
                                                );

                                                if (pickedTime != null) {
                                                  print(pickedTime.format(
                                                      context)); //output 10:51 PM
                                                  DateTime parsedTime =
                                                      DateFormat.jm().parse(
                                                          pickedTime
                                                              .format(context)
                                                              .toString());
                                                  //converting to DateTime so that we can further format on different pattern.
                                                  print(
                                                      parsedTime); //output 1970-01-01 22:53:00.000
                                                  String formattedTime =
                                                      DateFormat('HH:mm:ss')
                                                          .format(parsedTime);
                                                  print(
                                                      formattedTime); //output 14:59:00
                                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                                  setState(() {
                                                    timeCont.text =
                                                        formattedTime; //set the value of text field.
                                                  });
                                                } else {
                                                  print("Time is not selected");
                                                }
                                              },
                                              child: Icon(
                                                  Icons.access_time_outlined))),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                          SizedBox(
                              height: 15,
                            ),

                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: addressController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'address is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: CustomColors.grayColor
                                            .withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  fillColor:
                                      CustomColors.grayColor.withOpacity(0.15),
                                  filled: true,
                                  hintText: "Address"),
                            ),
                          ],
                        ),
                      ),
                      
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'username is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: CustomColors.grayColor
                                            .withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  fillColor:
                                      CustomColors.grayColor.withOpacity(0.15),
                                  filled: true,
                                  hintText: "Enter Username"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: mobileController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'mobile is required';
                                } else if (value.length != 10) {
                                  return "mobile no. should have 10 digits";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: CustomColors.grayColor
                                            .withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  fillColor:
                                      CustomColors.grayColor.withOpacity(0.15),
                                  filled: true,
                                  hintText: "Enter Mobile No."),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: noteController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: CustomColors.grayColor
                                            .withOpacity(0.6)),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  fillColor:
                                      CustomColors.grayColor.withOpacity(0.15),
                                  filled: true,
                                  hintText: "Enter note"),
                            ),

  SizedBox(
    height: 10,
  ),
                            Text(
                                    "Select Payment Options",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                        ),
                                  ),
SizedBox(
  height: 5,
),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                                                          child: Row(
                                          children: [
                                            Radio(
                                              value: 1,
                                              fillColor:
                                                  MaterialStateColor.resolveWith(
                                                      (states) => CustomColors
                                                          .primaryColor),
                                              activeColor: Colors.white,
                                              groupValue: _value,
                                              onChanged: (int? value) {
                                                setState(() {
                                                  _value = value!;
                                                  isCash = false;
                                                });
                                              },
                                            ),
                                            const Text(
                                              "Cash",
                                              style: TextStyle(
                                                  color: CustomColors.blackTemp,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                                                        ),
                                      ),

                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: 2,
                                              fillColor:
                                                  MaterialStateColor.resolveWith(
                                                      (states) => CustomColors
                                                          .primaryColor),
                                              groupValue: _value,
                                              onChanged: (int? value) {
                                                setState(() {
                                                  _value = value!;
                                                  isCash = true;
                                                });
                                              }),
                                          // SizedBox(width: 10.0,),
                                          const Text(
                                            "RazorPay",
                                            style: TextStyle(
                                                color: CustomColors.blackTemp,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                    ],
                                  )
                                    
                          ],
                        ),
                      ),

                    
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "GST Charge Total :",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "\u{20B9} 73,000.00",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                              SizedBox(
  height: 5,
),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total :",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "\u{20B9} 453,0000.00",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              color: CustomColors.grayColor,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Final Total :",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "\u{20B9} 4603000",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                   Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    homeScreen())); }
                  // if (_formKey.currentState!.validate()) {
                  //   showModalBottomSheet(
                  //       context: context,
                  //       builder: (context) {
                  //         return Container(
                  //           height: 240,
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: <Widget>[
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 18, top: 10),
                  //                 child: Text(
                  //                   "Payment Options",
                  //                   style: TextStyle(
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               ),
                  //               Container(
                  //                 margin: EdgeInsets.only(left: 18, top: 10),
                  //                 child: Text(
                  //                   "Select your preferred payment mode",
                  //                   style: TextStyle(),
                  //                 ),
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Radio(
                  //                         value: 1,
                  //                         fillColor:
                  //                             MaterialStateColor.resolveWith(
                  //                                 (states) => CustomColors
                  //                                     .primaryColor),
                  //                         activeColor: Colors.white,
                  //                         groupValue: _value,
                  //                         onChanged: (int? value) {
                  //                           setState(() {
                  //                             _value = value!;
                  //                             isCash = false;
                  //                           });
                  //                         },
                  //                       ),
                  //                       const Text(
                  //                         "Cash",
                  //                         style: TextStyle(
                  //                             color: CustomColors.blackTemp,
                  //                             fontSize: 14),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Radio(
                  //                           value: 2,
                  //                           fillColor:
                  //                               MaterialStateColor.resolveWith(
                  //                                   (states) => CustomColors
                  //                                       .primaryColor),
                  //                           groupValue: _value,
                  //                           onChanged: (int? value) {
                  //                             setState(() {
                  //                               _value = value!;
                  //                               isCash = true;
                  //                             });
                  //                           }),
                  //                       // SizedBox(width: 10.0,),
                  //                       const Text(
                  //                         "RazorPay",
                  //                         style: TextStyle(
                  //                             color: CustomColors.blackTemp,
                  //                             fontSize: 14),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   InkWell(
                  //                     onTap: () {
                  //                       Navigator.push(
                  //                           context,
                  //                           MaterialPageRoute(
                  //                               builder: (context) =>
                  //                                   homeScreen()));
                  //                     },
                  //                     child: Container(
                  //                         width: 180,
                  //                         height: 45,
                  //                         decoration: BoxDecoration(
                  //                             color: CustomColors.primaryColor,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(12)),
                  //                         alignment: Alignment.center,
                  //                         child: Text(
                  //                           "Book Now",
                  //                           style: TextStyle(
                  //                               fontSize: 16,
                  //                               color: CustomColors.whiteColor),
                  //                         )),
                  //                   )
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //         );
                  //       });
                //  }
                },
                child: Container(
                    width: 200,
                    height: 45,
                    alignment: Alignment.center,
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                          fontSize: 16, color: CustomColors.whiteColor),
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  side: const BorderSide(
                    width: 0.5,
                    color: CustomColors.primaryColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
