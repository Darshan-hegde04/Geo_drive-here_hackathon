import "package:flutter/material.dart" ;

import "package:login_page_firebase/carbon/carcarbon.dart";
class carbanSelect extends StatelessWidget {
      const carbanSelect({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>car())) ;
                },child: Text("Car")) ,
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>car())) ;
                }, child:Text("Public Transist")) ,
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>car())) ;
                }, child: Text("Bike")) ,
              ],
            ),
          ),
        );
      }
    }
