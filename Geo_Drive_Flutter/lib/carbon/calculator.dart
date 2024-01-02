
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:login_page_firebase/carbon/carcarbon.dart';

String CarbonCalculated ="list addition has taken place first" ;
Map MapCarbon = {"":""} ;
Future apiCall(String url)async
{
  http.Response response;
  response = await http.get(Uri.parse(url));
  if (response.statusCode == 201 ||response.statusCode == 202||response.statusCode == 200||response.statusCode == 203) {

    CarbonCalculated = response.body ;
    print(CarbonCalculated) ;
    MapCarbon = json.decode(response.body) ;
    Result  = MapCarbon['co2e_kg'];
    return MapCarbon['co2e_kg'];
  }
  else
    print("api not fetched") ;
  print(response.statusCode) ;
}