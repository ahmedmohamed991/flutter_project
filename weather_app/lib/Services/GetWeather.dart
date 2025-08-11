// ignore: file_names
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class weatherService {
  Future<weatherModel> GetWeather({required String CityName}) async {
    String baseUrl = 'http://api.weatherapi.com';
    String API_Key = '1d8b804871ba417e897104309240405';
    Uri url = Uri.parse(
        '$baseUrl/v1/forecast.json?key=$API_Key&q=$CityName&days=10&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weatherModel weather = weatherModel.fromjason(data);
    return weather;
  }
}
