import 'package:flutter/material.dart';
import 'package:login_page_firebase/DrawerNav.dart';
class mysetting extends StatefulWidget {
  const mysetting({super.key});

  @override
  State<mysetting> createState() => _mysettingState();
}

class _mysettingState extends State<mysetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(

      ),
      body: const Text("this is the settings page of the user"  ,
        style: TextStyle(
          fontSize: 60 ,
        ),),
    );
  }
}
