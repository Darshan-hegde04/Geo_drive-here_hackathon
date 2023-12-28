import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http  ;
import 'package:geolocator/geolocator.dart';

double soslat = 0 ; 
double soslon = 0 ; 
Future getCurrentlocation()async {
  print("entered") ;
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    print("permission not given");
    LocationPermission asked = await Geolocator.requestPermission();
  }
  else {
    print("enterererer") ;
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double soslat = currentPosition.latitude;
    double soslon = currentPosition.longitude;
    
    
  }
}
class maper extends StatefulWidget {
  const maper({super.key});

  @override
  State<maper> createState() => _maperState();
}

class _maperState extends State<maper> {
  final WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse(
  'https://m63a88w03g.execute-api.us-east-1.amazonaws.com/Dev?requesting=sos&latitude=$soslat&longitude=$soslon&query=hospital&limit=1'));
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
