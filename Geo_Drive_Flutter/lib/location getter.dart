import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http  ;
import 'package:geolocator/geolocator.dart';
double mylocationLat = 0 ;
double mylocationlon = 0 ;
double soslat = 0 ; 
double soslon = 0 ;
late Position currentPosition ;
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
 currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double mylocationLat = currentPosition.latitude;
    double mylocationlon= currentPosition.longitude;
    print(soslat) ;
    
  }
}
