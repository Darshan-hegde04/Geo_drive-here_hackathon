
import 'package:flutter/services.dart';

import 'package:login_page_firebase/Splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Starting(Login-Sign)/firebase_options.dart';





final emailtext = TextEditingController() ;
final passwordText = TextEditingController() ;
bool errorText  =false;

late UserCredential copyUser  ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // HereCore.SDKInitializer.init('HERE-3de71470-ab78-4db6-a1a9-547cf3b96c4e', 'aYLMbj3JPOnop48s0K2O');

runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  // Replace 'YOUR_API_KEY' with your actual HERE SDK API key
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(

        body: splashscreen(),
      ),
    );
  }
}
