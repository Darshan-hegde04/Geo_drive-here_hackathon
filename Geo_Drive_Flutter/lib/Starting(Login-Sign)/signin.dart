

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'package:login_page_firebase/Starting(Login-Sign)/Login.dart';
 late UserCredential userCredential ;


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //create cacount
  void createAcc()async{
    String email = emailtext.text.trim() ;
    String password = passwordText.text.trim() ;
    if(email=="" || password =="")
    {

    }
    else
    {
      try{ //creating new user
        userCredential =  await   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password) ;

        if(userCredential.user != null)
        {
          final message =SnackBar(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
              content: const Text("Signin Successful") )   ;

          ScaffoldMessenger.of(context).showSnackBar(message) ;
          Navigator.pop(context) ;
        }
      }
      on FirebaseAuthException  catch(e) {
        // AlertDialog(

        final message =SnackBar(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xffED1C39),
            duration: const Duration(seconds: 3),
            content: Text(e.message.toString())) ;

        ScaffoldMessenger.of(context).showSnackBar(message) ;


      }
    }
  }

  @override
  final  email = "" ;
  bool isloadings = false ;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(
                     height: 150,
                   ),
                  //Login text
                  Padding(
                    padding: const EdgeInsets.only( top: 20, left: 25.0) ,
                    child: Container(
                      child: Text(
                        "Sign In ",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 30 ,
                            fontWeight: FontWeight.bold ,
                            color: Color(0xffED1C39)
                          )
                        )
                      ),
                    ),
                  ),
                  // spacer
                  const SizedBox(
                    height: 5,
                  ) ,

                  //textfireld
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: emailtext,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(

                        prefixIcon: const Icon(Icons.email , color: Color(0xffED1C39),),
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter Email',
                      ),
                    ),
                  ),

                  //for password
                  Padding(
                    padding: const EdgeInsets.only(left: 20 ,right: 20 , top: 5),
                    child: TextFormField(
                      controller: passwordText,
                      obscureText: true,
                      obscuringCharacter: "*",
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(prefixIcon: const Icon(Icons.password_outlined ,color: Color(0xffED1C39),),


                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  //button
                  const SizedBox(
                    height: 20,
                  ) ,

                  // Sign in button
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor:  const Color(0xffED1C39) ,
                        ),
                      onPressed: ()async{



                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }

                          setState(() {
                            isloadings= true ;
                          });
                          createAcc();
                          // setState(() {
                          //   isloadings = false ;
                          // });


                      }, child:(isloadings)?
                      Transform.scale(scale: 0.5 ,
                        child: const CircularProgressIndicator(color: Colors.white,),


                      )

                    :const Text("Sign in"
                         , style: TextStyle(
                        color: Colors.white ,

                      ),
                    ),),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                   //have an account or not text
                  Row(
                    children: [
                      const SizedBox(
                        width: 70,
                      ),
                      const Text("Already have an account?"),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage())) ;
                        },
                        child: Text(
                            " Login",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 12 ,
                                  fontWeight: FontWeight.bold ,
                                  color: Color(0xffED1C39) ,
                                )
                            )
                        ),
                      ),
                    ],
                  )

                ],
              ),
              Container(
                height: 60,
                width: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                  ),
                  color: Color(0xffED1C39),
                ),
              )  ,
              Container(
                height: 60,
                width: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                  ),
                  color: Color(0xffED1C39),
                ),
              ) ,
          Positioned(

            left: 230,
            child: Container(
              height: 150,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                ),
                color: Color(0xffED1C39),
              ),
            ),
          )  ,

          ]),
        ),
      ),
    );
  }
}
