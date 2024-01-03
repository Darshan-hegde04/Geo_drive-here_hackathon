import 'package:flutter/material.dart';
import 'package:login_page_firebase/service.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'service.dart';
double start_lat = lat1 ;
double start_lon = lon1 ;
double end_lat= lat2 ;
double end_lon = lon2 ;



class displaym extends StatefulWidget {
  const displaym({super.key});

  @override

  State<displaym> createState() => _displaymState();
}

class _displaymState extends State<displaym> {

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'http://54.243.13.240/?start_lat=$start_lat&start_lon=$start_lon&end_lat=$end_lat&end_lon=$end_lon'));
  @override
  Widget build(BuildContext context) {
    return  WebViewWidget(controller: controller);

  }
}
