import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page_firebase/webview_map.dart';
class loading extends StatefulWidget {
  const loading({super.key});

  @override

  State<loading> createState() => _loadingState();
}
class _loadingState extends State<loading> {
 @override
  void initState() {
    // TODO: implement initState
   Timer(Duration(seconds: 8), () {
     Navigator.popUntil(context, (route) => route.isFirst);
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => webview())) ;
   }) ;
  }

  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: Colors.black,);
  }
}
