// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/GetWeather.dart';
import 'package:weather_app/providers/weather_provider.dart';

// ignore: camel_case_types
class Search_Screen extends StatelessWidget {
  Search_Screen({this.updateui});
  VoidCallback? updateui;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Search A City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
                label: Text('Search'),
                suffix: Icon(Icons.search),
                hintText: 'Enter city name',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 16)),
            onSubmitted: (data) async {
              String CityName = data;
              weatherService service = weatherService();
              weatherModel weather =
                  await service.GetWeather(CityName: CityName);
              Provider.of<weatherprovider>(context, listen: false).weatherData =
                  weather;
              Provider.of<weatherprovider>(context, listen: false).cityName =
                  CityName;
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
