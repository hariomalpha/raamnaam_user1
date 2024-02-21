import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raamnaam/Utils/colors.dart';

import '../AddToCart/ServiceCart.dart';

class ScheduleDateScreen2 extends StatefulWidget {
  const ScheduleDateScreen2({Key? key}) : super(key: key);

  @override
  State<ScheduleDateScreen2> createState() => _ScheduleDateScreen2State();
}

class _ScheduleDateScreen2State extends State<ScheduleDateScreen2> {
  String? selectedDate;
  TextEditingController dateCal = TextEditingController();
  TextEditingController guestController = TextEditingController();
  TextEditingController chefController = TextEditingController();
  TextEditingController helperController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Date"),
        backgroundColor: CustomColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Booking Date",
                      style: TextStyle(
                          color: CustomColors.grayColor
                      ),),
                    SizedBox(height: 10,),
                    TextFormField(
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
                                width: 1, color: CustomColors.grayColor.withOpacity(0.6)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),


                          fillColor:CustomColors.grayColor.withOpacity(0.15),
                          filled: true,
                          suffixIcon: GestureDetector(
                              onTap: () async {
                                DateTime? datePicked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(), lastDate: DateTime(2053));
                                if (datePicked != null) {
                                  print(
                                      'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                  String formettedDate =
                                  DateFormat('dd-MM-yyyy').format(datePicked);
                                  setState(() {
                                    selectedDate = formettedDate;
                                    dateCal.text= formettedDate;
                                  });
                                }
                              },
                              child: Icon(Icons.calendar_month))
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Number of guest",
                      style: TextStyle(
                          color: CustomColors.grayColor
                      ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: guestController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Number of guest is required';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: CustomColors.grayColor.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),


                        fillColor:CustomColors.grayColor.withOpacity(0.15),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Number of Chef",
                      style: TextStyle(
                          color: CustomColors.grayColor
                      ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: chefController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Number of chef is required';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: CustomColors.grayColor.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),


                        fillColor:CustomColors.grayColor.withOpacity(0.15),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Number of Helper",
                      style: TextStyle(
                          color: CustomColors.grayColor
                      ),),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: helperController,
                      validator: (value) {
                        if (value!.isEmpty ) {
                          return 'Number of helper is required';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: CustomColors.grayColor.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),


                        fillColor:CustomColors.grayColor.withOpacity(0.15),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),



              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceCart()));

                  }
                  setState(() {

                  });

                },

                child: Container(
                    width: 110,
                    height: 45,
                    alignment: Alignment.center,
                    child: Text("Save", style:TextStyle(fontSize: 16,
                        color: CustomColors.whiteColor),
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  side: const BorderSide(
                    width: 0.5,
                    color:CustomColors.primaryColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9),),
                  ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
