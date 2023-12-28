import 'package:flutter/material.dart';
import 'package:login_page_firebase/service.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'service.dart';

class displaym extends StatefulWidget {
  const displaym({super.key});

  @override

  State<displaym> createState() => _displaymState();
}

class _displaymState extends State<displaym> {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'http://54.243.13.240/?start_lat=$lat1&start_lon=$lon1&end_lat=$lat2&end_lon=$lon2'));
  @override
  Widget build(BuildContext context) {
    return  WebViewWidget(controller: controller);
  }
}
