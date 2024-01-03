import 'package:flutter/material.dart';

import '../Starting(Login-Sign)/Login.dart';
class bike extends StatefulWidget {
  const bike({super.key});

  @override
  State<bike> createState() => _bikeState();
}

class _bikeState extends State<bike> {
  @override
  TextEditingController distance = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body:  TextFormField(
        controller: distance,


        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide( color: themecolor.here,width: 2),
              borderRadius: BorderRadius.circular(30)
          ),
          prefixIcon: Icon(
              Icons.password_outlined,
              color: themecolor.here
          ),
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Enter the Distance',
        ),
      ),
    );
  }
}
