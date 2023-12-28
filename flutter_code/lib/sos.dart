import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class sos extends StatelessWidget {
  const sos({super.key});

  @override
  Widget build(BuildContext context) {
    late final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://map-testing.onrender.com/?start_lat=19.1334&start_lon=72.9133&end_lat=19.0596&end_lon=72.8295'));

    return Scaffold(
      body: WebViewWidget(controller: controller,),
    );
  }
}
