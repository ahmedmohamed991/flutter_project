import 'package:flutter/material.dart';

void main() {
  runApp(pointscounter());
}

class pointscounter extends StatefulWidget {
  pointscounter({super.key});

  @override
  State<pointscounter> createState() => _pointscounterState();
}

class _pointscounterState extends State<pointscounter> {
  int teamApoints = 0;

  int teamBpoints = 0;

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Points Counter'),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Team A',
                        style: TextStyle(fontSize: 33),
                      ),
                      Text(
                        '$teamApoints',
                        style: TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            teamApoints++;
                          });
                        },
                        child: Text(
                          'ADD 1 point',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.orange),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            teamApoints += 2;
                          });
                        },
                        child: Text(
                          'ADD 2 point',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.orange),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            teamApoints += 3;
                          });
                        },
                        child: Text(
                          'ADD 3 point',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.orange),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: VerticalDivider(
                    thickness: 2,
                    endIndent: 50,
                    indent: 50,
                  ),
                ),
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Team B',
                        style: TextStyle(fontSize: 33),
                      ),
                      Text(
                        '$teamBpoints',
                        style: TextStyle(fontSize: 150),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            teamBpoints++;
                          });
                        },
                        child: Text(
                          'ADD 1 point',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.orange),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            teamBpoints += 2;
                          });
                        },
                        child: Text(
                          'ADD 2 point',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.orange),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            teamBpoints += 3;
                          });
                        },
                        child: Text(
                          'ADD 3 point',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.orange),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  teamApoints = 0;
                  teamBpoints = 0;
                });
              },
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50), backgroundColor: Colors.orange),
            )
          ],
        ),
      ),
    ));
  }
}

