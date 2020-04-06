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
  'Haze' : 'images/haze.jpg',
  'Hail' : 'images/hail.jpg',
  'Thunderstorm' : 'images/thunder.jpg',
  'Snow' : 'images/snowy.jpg',
  'Clear' : 'images/clear.jpg',
  'Smoke' : 'images/smoky.jpg',
  'Wind' : 'images/windy.jpg',
  'Ice' : 'images/icy.jpg'
  };
  Map textColor = {'Mist' : Colors.grey,
  'Clouds' : Colors.white,
  'Rain' : Colors.white,
  'Haze' : Colors.black,
  'Hail' : Colors.black,
  'Thunderstorm' : Colors.grey,
  'Snow' : Colors.black,
  'Clear' : Colors.white,
  'Smoke' : Colors.white,
  'Wind' : Colors.grey,
  'Ice' : Colors.black
  };

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
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
              Text(
                data['location'],
                style: TextStyle(
                  color:textColor[data['desc']],
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Latitude:'+data['lati'],
                      style: TextStyle(
                        color:textColor[data['desc']],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width:5),
                    Text('Longitude:'+data['longi'],
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
                  Text(
                      'Desc:'+data['desc'],
                      style: TextStyle(
                        color: textColor[data['desc']],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width:15),
                  Text('Temp:'+data['temp'],
                  style: TextStyle(
                    color:textColor[data['desc']],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ],
          ),
          ),
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(bgImage[data['desc']]),
          fit: BoxFit.cover),
        ),
      ),
      
    );
  }
}