import 'package:http/http.dart';
import 'dart:convert';
class Weather{
  String location;  //To get Location
  String temp;
  String desc;
  String latitude;
  String longitude;
  String countrycode;
  String sunrise;
  String sunset;
  String time;
  String dayLength;
  DateTime sunr;
  DateTime suns;
  Weather({this.location});
  Future<void> getWeatherData() async{
    try{
    Response response1 = await get('http://api.openweathermap.org/data/2.5/weather?q=$location&appid=efe915b288159303cfeb51811a2f8027');
    Map data = jsonDecode(response1.body);
    print(data);   
    temp = (data['main']['feels_like']-273).toStringAsFixed(2);
    desc = data['weather'][0]['main'];
    latitude = (data['coord']['lat']).toString();
    longitude = (data['coord']['lon']).toString();
    Response response2 = await get('https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude');
    Map data1 = jsonDecode(response2.body);
    print(data1);
    sunrise = data1['results']['sunrise'];
    sunset = data1['results']['sunset'];
    dayLength = data1['results']['day_length'];
    
    // print(sunrise);
    // print(sunset);
    }
    catch(e){
      temp = 'null';
      desc = 'null';
      latitude = 'null';
      longitude = 'null';
      sunrise = 'null';
      sunset = 'null';
    }
  }
}