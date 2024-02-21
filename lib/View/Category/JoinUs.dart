import 'package:flutter/material.dart';
class JoinUs extends StatefulWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController doorNo = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController area = TextEditingController();

  // String? firstName,
  //     lastName,
  //     mobile,
  //     email,
  //     doorNo,
  //     street,
  //     address,
  //     country,
  //     city,
  //     state,
  //     area;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8F0202),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Join Us',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'First Name',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: firstName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Last Name',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: lastName,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Last name';
                  }
                  return null;
                },
                //  onChanged: (value) => lastName.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mobile Number',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: mobileNumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  counter: Container(),
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Mobile Number';
                  }
                  if (value.length != 10) {
                    return 'Mobile number should be 10 digits';
                  }
                  return null;
                },
                //  onChanged: (value) => mobileNumber.text = value,
              ),
              Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value2) {
                  if (value2!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value2)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                // onChanged: (value2) => email.text = value2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Door No.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: doorNo,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Door no';
                  }
                  return null;
                },
                //  onChanged: (value) => doorNo.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Street',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: street,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter street';
                  }
                  return null;
                },
                //   onChanged: (value) => street.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Address',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: address,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Address';
                  }
                  return null;
                },
                //     onChanged: (value) => address.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Country',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: country,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Country';
                  }
                  return null;
                },
                //    onChanged: (value) => country.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'City',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: city,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                //   onChanged: (value) => city.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'State',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: state,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your State';
                  }
                  return null;
                },
                //    onChanged: (value) => state.text = value,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Area',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: area,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Area';
                  }
                  return null;
                },
                //    onChanged: (value) => area.text = value,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process data or navigate to another screen
                    print('Form is valid');
                  } else {
                    print('Form is invalid');
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF8F0202),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}