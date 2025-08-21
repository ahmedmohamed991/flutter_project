import 'package:flutter/material.dart';

class weatherModel {
  DateTime? date;
  double? temp;
  double? max_Temp;
  double? min_Temp;
  String? weatherStateName;
  weatherModel(
      {required this.date,
      required this.temp,
      required this.max_Temp,
      required this.min_Temp,
      this.weatherStateName});
  factory weatherModel.fromjason(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return weatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        max_Temp: jsonData['maxtemp_c'],
        min_Temp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  MaterialColor getThemcolor() {
    if (weatherStateName == 'Light Cloud' || weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Clear' || weatherStateName == 'Cloudy') {
      return Colors.blue;
    } else if (weatherStateName == 'Rainy') {
      return Colors.blue;
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.amber;
    } else {
      return Colors.orange;
    }
  }

  String getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Clear' || weatherStateName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Rainy') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
