import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_firebase/Starting(Login-Sign)/Login.dart';

import 'Starting(Login-Sign)/actionUser_choose.dart';
import 'home3.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
     if(FirebaseAuth.instance.currentUser!=null)
     { Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home())) ;}
      else{
        Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Choose()));
      }  ;

    }) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Geo Drive" ,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold ,
            fontSize: 50,
            color: Colors.black,

            )
          ),),
        ),
      ),
    );
  }
}
