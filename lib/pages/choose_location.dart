import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtime_app2/services/weather.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Weather> locations = [
    Weather(location: 'London'),
    Weather(location: 'Washington'),
    Weather(location: 'San Diego'),
    Weather(location: 'Cairo'),
    Weather(location: 'Kolkata'),
    Weather(location: 'New York'),
    Weather(location: 'Tokyo'),
    Weather(location: 'Shanghai'),
    Weather(location: 'Sao Paulo'),
    Weather(location: 'Mexico'),
    Weather(location: 'Dhaka'),
    Weather(location: 'Jakarta'),
    Weather(location: 'Manila'),
    Weather(location: 'Seoul'),

  ];

  Future<String> setupNewLocation(BuildContext context) async{
    TextEditingController controller = TextEditingController();
    return showDialog(context: context,builder:(context){
      return AlertDialog(
        title: Text(
          'Add New Location',
          style: TextStyle(color: Colors.blue),
          ),
        content: TextField(
          controller: controller,
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop(controller.text.toString());
            },
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],

      );
    });
  }

  void updateWeather(index) async{
    Weather x1 = locations[index];
    await x1.getWeatherData();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      'location' : x1.location,
      'longi' : x1.longitude,
      'lati' : x1.latitude,
      'temp' : x1.temp,
      'desc' : x1.desc,
    });
  }


  String loc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: () async{
                  loc = await setupNewLocation(context);
                  setState(() {
                    locations.add(Weather(location: loc));
                  });
              }),
            ],
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateWeather(index);
              },
              title: Text(locations[index].location),
            ),
            ),
        );
      },
      itemCount: locations.length,),
    floatingActionButton: FloatingActionButton(onPressed: ()async{
                  loc = await setupNewLocation(context);
                  setState(() {
                    locations.add(Weather(location: loc));
                  });
              },
              child: Icon(Icons.add,color: Colors.white,),
              backgroundColor: Colors.blue,),
    );
  }
}