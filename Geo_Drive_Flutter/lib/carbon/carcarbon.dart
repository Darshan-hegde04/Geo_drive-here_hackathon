import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_firebase/carbon/calculator.dart';

import '../Starting(Login-Sign)/Login.dart';
String Result = "" ;
class car extends StatefulWidget {
  const car({super.key});

  @override
  State<car> createState() => _carState();
}

class _carState extends State<car> {
  final TextEditingController distance = TextEditingController();
  String dropdownvalue = 'Car-Type-Mini';
  String vehicleChooes ="s";
  var items =[
    "Car-Type-Mini"      ,
    "Car-Type-SuperMini" ,
    "Car-Type-UpperMedium" ,
    "Car-Type-Executive"  ,
    "Car-Type-Luxery"     ,
    "Car-Type-Sports"     ,
    "Car-Type-4x4 "        ,
    "Car-Type-MPV"       ,
    "Car-Size-Small"     ,
    "Car-Size-Medium"    ,
    "Car-Size-Large"     ,
    "Car-Size-Average"   ,
  ] ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ) ,
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            SizedBox(
              height: 30,
            ) ,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: distance,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly

                ],
                decoration: InputDecoration(
                    hintText: "Enter the distance"
                ),
              ),
            ),
            ElevatedButton(onPressed: ()async{

                var dist = distance ;

              await apiCall("https://pok4hyd2h2.execute-api.us-east-1.amazonaws.com/Dev?query=cartravel&distance=100&type=Car-Type-Mini") ;
              setState(() {
                car() ;
              });
            }, child: Text("Enter"))  ,
            Center(
              child: Text(Result + "Kg", style: TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 30 ,
              ),),
            )
          ],
        ),
      ),
    );
  }
}
