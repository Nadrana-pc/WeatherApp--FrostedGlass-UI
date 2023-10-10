import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model.dart';


class ApiClass with ChangeNotifier {
  WeatherModel? weatherList;
  WeatherModel? get weatherlist => weatherList!;
  // List<WeatherModel> weatherdata = [];
  String? location;

  void setLocation(String searchQuery) {
    

    if (searchQuery.isEmpty) {

      TODO: //Fetch device location and before it handle permission 
      //Add location permission on AndroidManifest.xml 
      //use 'permission_handler' package and 'geolocator' 
      location = "kannur";
    } else {
      location = searchQuery;
      print("SearchQuery: $searchQuery");
    }
  }


  Future<void> fetchdata() async {
  
    try {
      var url = Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=82049e30049d4fb091f93603231509&q=$location");
      var responce = await http.get(url);
      if (responce.statusCode == 200) {
        print(responce.body);
        weatherList = weatherModelFromJson(responce.body);

        notifyListeners();
      } else {}
    } catch (e) {
      throw (Exception(e));
    }
  }
}
