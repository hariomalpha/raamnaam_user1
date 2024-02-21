import 'package:flutter/material.dart';
import 'package:raamnaam/Utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification"),centerTitle: true, backgroundColor: CustomColors.primaryColor,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 6, // The number of items in your list
            itemBuilder: (BuildContext context, int index) {
              // This function is called for each item in the list
              // You can return a widget based on the index
              return _buildListItem(index);
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildListItem(int index) {
  return Card(
    elevation: 4,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Border color
          width: 1, // Border width
        ),
        borderRadius: BorderRadius.circular(4.0), // Optional: Add rounded corners
      ), // Optional: Add margin for spacing
      child: ListTile(
        // Your item content here
        title: Text('Notification $index'),
      ),
    ),
  );
}
