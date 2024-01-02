import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page_firebase/Settings.dart';

import 'package:login_page_firebase/webview_map.dart';
import 'Starting(Login-Sign)/actionUser_choose.dart';

import 'home3.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  void logout()async{
    await FirebaseAuth.instance.signOut() ;
    final message =SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        content: const Text("Logged out") )   ;

    ScaffoldMessenger.of(context).showSnackBar(message) ;
    Navigator.popUntil(context, (route) => route.isFirst) ;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Choose())) ;
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Container(
          color: const Color(0xffF7F7F7),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(

                      backgroundColor: Colors.transparent,

                      radius: 50,
                    ) ,
                    Text(
                      'Akshay Hegde',
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffE4DC8C),
                      Color(0xff52DACC) ,
                    ],
                  )
                ),
              ),
              ListTile(
                leading: const  Icon(Icons.home),
                title: const Text('Home page'),
                onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>const home()))},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>const mysetting()))},
              ),
              ListTile(
                leading: const Icon(Icons.maps_home_work),
                title: const Text('Map'),
                onTap: () => {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Webview()))
                },
              ),
              ListTile(
                leading: const Icon(Icons.border_color),
                title: const Text('Feedback'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () => {
                  logout()
                  },
              ),
            ],
          ),
        ),
      ) ;

  }
}
