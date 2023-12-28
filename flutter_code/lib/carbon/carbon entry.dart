import 'package:flutter/material.dart';

class carbanselect extends StatefulWidget {
  const carbanselect({Key? key}) : super(key: key);

  @override
  _carbanselectState createState() => _carbanselectState();
}

class _carbanselectState extends State<carbanselect> {

// Initial Selected Value
  String dropdownvalue = 'Car';

// List of items in our dropdown menu
  var items = [
    'Car' ,
    'Public Transist' ,
    'Moterbike' , 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
