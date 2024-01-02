// Change the type of data to Map<String, dynamic>
import 'package:http/http.dart'as http;
import 'dart:convert';
List <double> cordinates = [] ;

Map<String, dynamic> data = {};

double lat1 = 0  ;
double lon1 = 0 ;
double lat2 = 0 ;
double lon2 = 0 ;

Future apiCall1(String url) async {
  http.Response response;
  response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.body);
    print(response.statusCode);

    // Decode the JSON response into a Map
    data = json.decode(response.body);

    // Accessing latitude and longitude from the Map
     lat1 = data['latitude'];
    lon1 = data['longitude'];

    print(lat1 + lat2) ;

  } else {
    print("API not fetched");
  }
  print(response.statusCode);
}
Future apiCall2(String url) async {
  http.Response response;
  response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.body);
    print(response.statusCode);

    // Decode the JSON response into a Map
    data = json.decode(response.body);

    // Accessing latitude and longitude from the Map
   
  } else {
    print("API not fetched");
  }
  print(response.statusCode);
}
