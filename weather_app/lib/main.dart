import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/Home_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return weatherprovider();
      },
      child: weather_app()));
}

// ignore: camel_case_types
class weather_app extends StatelessWidget {
  weather_app({super.key});
  weatherModel? weather;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<weatherprovider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<weatherprovider>(context)
                      .weatherData!
                      .getThemcolor()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
