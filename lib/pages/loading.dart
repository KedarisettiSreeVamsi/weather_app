import 'package:flutter/material.dart';
import 'package:worldtime_app2/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWeatherData() async{
    Weather x1 = Weather(location:'Visakhapatnam');
    await x1.getWeatherData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : x1.location,
      'longi' : x1.longitude,
      'lati' : x1.latitude,
      'temp' : x1.temp,
      'desc' : x1.desc,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWeatherData();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SpinKitThreeBounce(size:25,color:Colors.black),
        ),
      ),
    );
  }
}