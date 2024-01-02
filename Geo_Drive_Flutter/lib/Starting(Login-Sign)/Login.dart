import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_firebase/constants.dart';
import 'package:login_page_firebase/Starting(Login-Sign)/signin.dart';
import '../home3.dart';
import '../main.dart';

import '../main.dart';
TextEditingController emailsign = TextEditingController();
TextEditingController passwordsign = TextEditingController();
theme themecolor = theme() ;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final email = "";
  bool isloading = false ;

  Future enterUser() async {
    String emais = emailsign.text.trim();
    String passwors = passwordsign.text.trim();
    if (emais == "" || passwors == "") {
    } else {
      try {
        //creating new user
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emais, password: passwors);

        print(userCredential.user);
        if (userCredential.user != null) {
          final message =SnackBar(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
              content: Text("Login Successful") )   ;
          ScaffoldMessenger.of(context).showSnackBar(message) ;
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => home()));
        }
      } on FirebaseAuthException catch (e) {
        // AlertDialog(
        //   title: Text(e.toString()),
        //
        // ) ;
        final message =SnackBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: themecolor.here,
            duration: Duration(seconds: 3),
            content: Text(e.message.toString())) ;

        ScaffoldMessenger.of(context).showSnackBar(message) ;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
             color: Colors.white
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(200),
            ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffE4DC8C),
                  themecolor.here,
                ],
              )
          ),

        ) ,
        Positioned(
          top: 200,
          left: 30,
          child: Container(

            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(

                  blurRadius: 10,

                )
              ],
             color: Colors.white ,
              borderRadius: BorderRadius.circular(40) ,
            ),
            width: 300,
            height: 400,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Login text
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25.0),
                  child: Container(
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color:themecolor.here
                            ,
                          fontSize: 30 ,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                  ),
                ),
                // spacer
                SizedBox(
                  height: 20,
                ),
                //textfireld
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(

                    controller: emailsign,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: themecolor.here,width: 2),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: themecolor.here
                        ,
                      ),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter Email',
                    ),
                  ),
                ),
                //for password
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: TextFormField(
                    controller: passwordsign,
                    obscureText: true,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: themecolor.here,width: 2),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      prefixIcon: Icon(
                        Icons.password_outlined,
                          color: themecolor.here
                      ),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                //sign in
                //button
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:110 ,),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: themecolor.here,
                    ),
                    onPressed: () async{
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }
                      setState(() {
                        isloading= true;
                      });
                      print(emailtext.text);
                     await  enterUser();
                      // setState(() {
                      //   isloading =false ;
                      // });
                    },
                    child: (isloading)?
                        Transform.scale(
                          scale: 0.5,
                          child: CircularProgressIndicator(
                            color: Colors.white,),
                        )
                   : Text("login" , style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white ,
                        fontWeight: FontWeight.bold
                      )
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,

                      ) ,
                      Text("Dont have a account? " ,
                        style: TextStyle(
                            // color: Color(0xffED1C39)
                        ),

                      )
                      ,
                      Text(
                        "Sigin",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 12 ,
                            fontWeight: FontWeight.bold ,
                              color: themecolor.here ,
                          )
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
