import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page_firebase/carbon/carbon%20entry.dart';
import 'package:login_page_firebase/soser.dart';
import 'package:login_page_firebase/webview_map.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'DrawerNav.dart';
import 'Starting(Login-Sign)/actionUser_choose.dart';
import 'location getter.dart';
import "constants.dart";
import "package:login_page_firebase/carbon/carbon entry.dart" ;



String ErrorMessage = "";

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    final message = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        content: const Text("Logged out"));

    ScaffoldMessenger.of(context).showSnackBar(message);
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Choose()));
  }

  bool loader = false;
final GlobalKey<SideMenuState> sideMenuKey  = GlobalKey<SideMenuState>()  ; 
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Colors.white,
      menu: NavDrawer(),
      key: sideMenuKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              if(sideMenuKey.currentState!.isOpened)
                {
                  sideMenuKey.currentState!.closeSideMenu() ;
                }
              else{
                sideMenuKey.currentState!.openSideMenu();

              }
            }, icon: const Icon(Icons.menu)),
            backgroundColor: Colors.white,
          ),
          body:const gridview()
      
        ),
      ),
    );
  }
}
class gridview extends StatefulWidget {
  const gridview({super.key});

  @override
  State<gridview> createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(15),
      crossAxisSpacing: 20,
      mainAxisSpacing: 50,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTap:() async{
           await getCurrentlocation() ;
           Navigator.push(context, MaterialPageRoute(builder: (context)=>soser() )) ;
          } ,
          child: Container(
            decoration: decor,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: const Text("SOS"  ,style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold ,
                color: Colors.red
              ),),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>webview())) ;
          },
          child: Container(
            decoration: decor,
            padding: const EdgeInsets.all(8),
            child:Image.asset("assets/map.png")
          ),
        ),
        GestureDetector(
          onTap:() {
            getCurrentlocation() ;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>carbanSelect() )) ;
            } ,
          child: Container(
            decoration: decor,
            padding: const EdgeInsets.all(8),
            child: Image.asset("assets/carbon.jpg"),
          ),
        ),

      ],
    );
  }
}
