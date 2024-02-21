import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raamnaam/Utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Choose Image Source'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.camera);
              },
              child: Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final XFile? image = await _picker.pickImage(source: source);

      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8F0202),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: _selectedImage != null
                      ? DecorationImage(
                          image: FileImage(File(_selectedImage!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: _selectedImage == null
                    ? Icon(Icons.person, size: 50)
                    : null,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text("Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ],
            ),
            Divider(),
            profileTile('Full Name :', 'Raam Naam'),
            profileTile('Email :', 'raamnaam@gmail.com'),
            profileTile('Mobile Number :', '7417417417'),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => BookingScreen()));
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
                    "Update Profile",
                    style: TextStyle(
                      fontSize: 16,
                      color:  CustomColors.whiteColor
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileTile(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  color:  CustomColors.blackTemp,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color:  CustomColors.blackTemp,
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}