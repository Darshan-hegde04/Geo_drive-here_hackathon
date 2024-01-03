import 'dart:async';
import 'package:login_page_firebase/displayweb.dart';

import 'service.dart';
import 'package:flutter/material.dart';
import 'package:login_page_firebase/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "service.dart" ;
TextEditingController startingloc= TextEditingController();
TextEditingController endingloc = TextEditingController();
void cal()async
{
  var start = startingloc.text;
  await apiCall1("https://3119-34-229-46-215.ngrok-free.app/?requesting=location&address=$start") ;
  var stop = endingloc.text ;
  await apiCall1("https://3119-34-229-46-215.ngrok-free.app/?requesting=location&address=$stop") ;

}

class webview extends StatefulWidget {
  const webview({Key? key}) : super(key: key);

  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ) ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      child:  TextFormField(
                        controller: startingloc,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide( color: Colors.black,width: 2),
                              borderRadius: BorderRadius.circular(30)
                          ),

                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Starting location',
                        ),
                      ),


                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ) ,
                  Container(
                    child:  TextFormField(
                      controller: endingloc,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide( color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(30)
                        ),

                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Ending location',
                      ),
                    ),


                  ),
                  SizedBox(
                    height: 5,
                  ) ,
                  ElevatedButton(onPressed: (){
                    setState(() async{
                      var start = startingloc.text;
                      await apiCall1("https://m63a88w03g.execute-api.us-east-1.amazonaws.com/Dev?requesting=location&address=$start") ;
                      var stop = endingloc.text ;
                      await apiCall1("https://m63a88w03g.execute-api.us-east-1.amazonaws.com/Dev?requesting=location&address=$stop") ;
                      await displaym()  ;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>displaym())) ;

                    });
                  }, child: Text("search"))
                ],
              ),
            )
          ],
        ),
      ),
    ) ;

  }
}
