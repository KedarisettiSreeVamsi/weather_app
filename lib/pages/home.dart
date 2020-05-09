import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Map bgImage = {'Mist' : 'images/mist.jpg',
  'Clouds' : 'images/cloudy.jpg',
  'Rain' : 'images/rainy.jpg',
  'Drizzle' : 'images/rainy.jpg',
  'Haze' : 'images/haze.jpg',
  'Hail' : 'images/hail.jpg',
  'Thunderstorm' : 'images/thunder.jpg',
  'Snow' : 'images/snowy.jpg',
  'Clear' : 'images/clear.jpg',
  'Smoke' : 'images/smoky.jpg',
  'Wind' : 'images/windy.jpg',
  'Ice' : 'images/icy.jpg'
  };
  Map textColor = {'Mist' : Colors.white,
  'Clouds' : Colors.white,
  'Rain' : Colors.white,
  'Drizzle' : Colors.white,
  'Haze' : Colors.black,
  'Hail' : Colors.black,
  'Thunderstorm' : Colors.grey,
  'Snow' : Colors.black,
  'Clear' : Colors.white,
  'Smoke' : Colors.white,
  'Wind' : Colors.grey,
  'Ice' : Colors.black
  };
  Map weatherIcon = {'Mist' : 'weather_icons/mist.png',
  'Clouds' : 'weather_icons/cloud.png',
  'Rain' : 'weather_icons/rain.png',
  'Drizzle' : 'weather_icons/drizzle.png',
  'Haze' : 'weather_icons/haze.png',
  'Hail' : 'weather_icons/hail.png',
  'Thunderstorm' : 'weather_icons/storm.png',
  'Snow' : 'weather_icons/snow.png',
  'Clear' : 'weather_icons/sky.png',
  'Smoke' : 'weather_icons/smoke.png',
  'Wind' : 'weather_icons/wind.png',
  'Ice' : 'weather_icons/ice.png'
  };

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.fromLTRB(0, 250, 0, 150),
            child: Column(
              children:<Widget>[
                FlatButton.icon(
                  onPressed: ()async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    data = {
                      'location' : result['location'],
                      'lati' : result['latitude'],
                      'longi' : result['logitude'],
                      'desc' : result['desc'],
                      'temp' : result['temp'],
                    };
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color:textColor[data['desc']]),
                  label: Text('Edit Location',
                  style: TextStyle(
                    color:textColor[data['desc']],
                  ),)
                ),
                SizedBox(height:15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image:AssetImage(weatherIcon[data['desc']])),
                    Text(
                      data['temp']+'\u1d52'+'C',
                      style: TextStyle(
                        color:textColor[data['desc']],
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  data['desc'],
                  style: TextStyle(
                      color: textColor[data['desc']],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Latitude:',
                        style: TextStyle(
                          color:textColor[data['desc']],
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width:5),
                      Text('Longitude:',
                      style: TextStyle(
                        color:textColor[data['desc']],
                        fontSize: 18,
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        data['lati'],
                        style: TextStyle(
                          color:textColor[data['desc']],
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width:3),
                      Text(data['longi'],
                      style: TextStyle(
                        color:textColor[data['desc']],
                        fontSize: 18,
                      ),)
                    ],
                  ),
                ),
                SizedBox(height:15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      SizedBox(width:15),
                    Text(data['location'],
                    style: TextStyle(
                      color:textColor[data['desc']],
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ],
            ),
            ),
        ),
          height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(bgImage[data['desc']]),
          fit: BoxFit.cover),
        ),
      ),
      
    );
  }
}