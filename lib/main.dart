import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:testing_trail/models/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define your text data

  WeatherOfWorld weatherOfWorld = WeatherOfWorld();
  // Weather weather = Weather();

  bool circular_indicator_bool = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    Response res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=37f5eaac8d6bd4b56ed3fef9c3b10986'));
    var resultOfWeather = jsonDecode(res.body);
    weatherOfWorld = WeatherOfWorld.fromJson(resultOfWeather);

    // var weather = jsonDecode(res.body);
    // weather = Weather.fromJson(resultOfWeather);

    circular_indicator_bool = false;

    setState(() {});

    //   print(
    //       'This Data is of weatherOfWorld ${weatherOfWorld.weather.toString()}');
    //   print(
    //       'This Data is of weather ${weather.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
              child: circular_indicator_bool
                  ? const CircularProgressIndicator()
                  : Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Coordinates',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ),

                        Text('Lattitude ' +
                            weatherOfWorld.coord!.lat.toString()),
                        Text('Longitude ' +
                            weatherOfWorld.coord!.lon.toString()),

                        const Text(
                          'Weather',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),

                        Text(
                            'Weather id is ${weatherOfWorld.weather![0].id.toString()}'),
                        Text(
                            'Weather id is ${weatherOfWorld.weather![0].main.toString()}'),
                        Text(
                            'Weather id is ${weatherOfWorld.weather![0].description.toString()}'),
                        // Text(
                        //     'Weather id is ${weatherOfWorld.weather![0].icon}'),

                        const Text(
                          'Base',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Text(weatherOfWorld.base.toString()),

                        const Text(
                          'Main',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),

                        Text('Normal Temprature ' +
                            weatherOfWorld.main!.temp.toString()),

                        Text('Feels Like ' +
                            weatherOfWorld.main!.feelsLike.toString()),
                        Text('Minimum Temprature ' +
                            weatherOfWorld.main!.tempMin.toString()),
                        Text('Maximum Temprature ' +
                            weatherOfWorld.main!.tempMax.toString()),
                        Text('Pressure ' +
                            weatherOfWorld.main!.pressure.toString()),
                        Text('Humididty ' +
                            weatherOfWorld.main!.humidity.toString()),
                        Text('Sealevel ' +
                            weatherOfWorld.main!.seaLevel.toString()),
                        Text('Ground Level ' +
                            weatherOfWorld.main!.grndLevel.toString()),

                        Text('Visibility ' +
                            weatherOfWorld.visibility.toString()),

                        const Text(
                          'Wind',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),

                        Text('Speed ' + weatherOfWorld.wind!.speed.toString()),
                        Text('Deg ' + weatherOfWorld.wind!.deg.toString()),
                        Text('Gust ' + weatherOfWorld.wind!.gust.toString()),

                        // Text(weatherOfWorld)

                        // Text(weather.main.toString())
                      ],
                    ))),
    );
  }
}
