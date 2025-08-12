import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';

class weatherprovider extends ChangeNotifier {
  weatherModel? _weatherdata;
  String? cityName;
  set weatherData(weatherModel? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  weatherModel? get weatherData => _weatherdata;
}
