import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/Search_Screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomepageState();
}

// ignore: camel_case_types
class _HomepageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  weatherModel? weatherdata;
  @override
  Widget build(BuildContext context) {
    weatherdata = Provider.of<weatherprovider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search_Screen(
                            updateui: updateUi,
                          )),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherdata == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('There Is No Weather 🧐 , Start',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Searching Naw 🔎⛅',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            )
          : Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<weatherprovider>(context).cityName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated: 12-1-2022',
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/clear.png'),
                      Text(
                        '${weatherdata!.temp!.toInt()}',
                        style: TextStyle(fontSize: 33),
                      ),
                      Column(
                        children: [
                          Text('MaxTemp:${weatherdata!.max_Temp!.toInt()}'),
                          Text('MinTemp:${weatherdata!.min_Temp!.toInt()}')
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(weatherdata!.weatherStateName!,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
