import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  final List<String> categories;
  final Function(String) onChanged;

  CategoryDropdown({required this.categories, required this.onChanged});

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String dropdownValue = '';

  List items = [
    'Name',
    'time',
     'location'
    

  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        widget.onChanged(dropdownValue);
      },
      items: widget.categories
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
