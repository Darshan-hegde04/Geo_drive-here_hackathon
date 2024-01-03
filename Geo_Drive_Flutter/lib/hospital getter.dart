
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:login_page_firebase/carbon/carcarbon.dart';
double hospitallat = 0 ;
double hospitallon = 0 ;
String CarbonCalculated ="list addition has taken place first" ;
List MapCarbon = [] ;
Future apiCallol(String url)async
{
  http.Response response;
  response = await http.get(Uri.parse(url));
  if (response.statusCode == 201 ||response.statusCode == 202||response.statusCode == 200||response.statusCode == 203) {
    print("hospital entered") ;
    CarbonCalculated = response.body ;

    MapCarbon = json.decode(response.body) ;
    hospitallat = MapCarbon[0]["Latitude"] ;
    hospitallon = MapCarbon[0]["Longitude"] ;
    print(hospitallat) ;
    print(hospitallon) ;
  }
  else
    print("api not fetched") ;
  print(response.statusCode) ;
}