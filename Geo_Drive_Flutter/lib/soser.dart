import 'package:flutter/material.dart';
import 'package:login_page_firebase/carbon/calculator.dart';
import 'package:login_page_firebase/location%20getter.dart';
import 'package:login_page_firebase/service.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'hospital getter.dart';
import 'service.dart';



double start_lat = lat1 ;
double start_lon = lon1 ;
double end_lat= lat2 ;
double end_lon = lon2 ;
void startinglocation()async{
  print('personnal location entered') ;
  await getCurrentlocation() ;
  await apiCallol('https://m63a88w03g.execute-api.us-east-1.amazonaws.com/Dev?requesting=sos&latitude=${currentPosition.latitude}&longitude=${currentPosition.longitude}&query=hospital&limit=1') ;
}


class soser extends StatefulWidget {
  const soser({super.key});
  @override

  State<soser> createState() => _soserState();
}

class _soserState extends State<soser> {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'http://54.243.13.240/?start_lat=19.1334&start_lon=72.9133&end_lat=19.0596&end_lon=72.8295'));


  @override

  Widget build(BuildContext context) {
    startinglocation() ;
    return WebViewWidget(controller: controller) ;

  }
}

