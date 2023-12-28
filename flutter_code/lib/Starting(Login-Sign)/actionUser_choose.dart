import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_firebase/Starting(Login-Sign)/Login.dart';
import 'package:login_page_firebase/Starting(Login-Sign)/signin.dart';




class Choose extends StatefulWidget {
  const Choose({super.key});
  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
 bool isloading = false ;

  Widget build(BuildContext context) {
    return Scaffold(
      // the red background image along with "welcome text"
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(children: <Widget>[
          Container(
            height: 800,
            width: 500,

             color: Colors.white,

          ),
          Image.asset(
            "assets/lady.png",
            frameBuilder: (BuildContext context, Widget child,
                int? frame, bool wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: child,
              );
            },

            scale: 0.4,
            height: 400,
            width: 600,
            fit: BoxFit.fill,
          ) ,

          Positioned(
              top: 430,
              left: 90,
              child: Text("Welcome",
                  style: GoogleFonts.pacifico(
                      textStyle:
                          TextStyle(fontSize: 40, color: Color(0xffB3001B))))),
          //buttons about logging in and sign in
          Positioned(
            top: 510,
            left: 30,
            right: 30,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50, width: 290),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffED1C39),
                    elevation: 10,
                    shadowColor: Colors.red[100]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 30,
            right: 30,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 50, width: 290),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffED1C39),
                    elevation: 10,
                    shadowColor: Colors.red[100]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Login In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
