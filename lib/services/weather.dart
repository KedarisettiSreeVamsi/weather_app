import 'package:http/http.dart';
import 'dart:convert';
class Weather{
  String location;  //To get Location
  String temp;
  String desc;
  String latitude;
  String longitude;
  Weather({this.location});
  Future<void> getWeatherData() async{
    try{
      Response response1 = await get('http://api.openweathermap.org/data/2.5/weather?q=$location&appid=efe915b288159303cfeb51811a2f8027');
    Map data = jsonDecode(response1.body);
    temp = (data['main']['feels_like']-273).toStringAsFixed(2);
    desc = data['weather'][0]['main'];
    latitude = (data['coord']['lat']).toString();
    longitude = (data['coord']['lon']).toString();
    }
    catch(e){
      temp = 'null';
      desc = 'null';
      latitude = 'null';
      longitude = 'null';
    }
  }
}