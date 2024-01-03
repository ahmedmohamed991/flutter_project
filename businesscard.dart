import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessCard());
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xff4A2B14),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 115,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 111,
              backgroundImage: AssetImage(
                  'images/WhatsApp Image 2023-03-17 at 03.28.36.jpg'),
            ),
          ),
          const Text(
            'Ahmed Hafez',
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontFamily: 'Pacifico'),
          ),
          const Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
                color: Color(0xff6c8090),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 111, 115, 118),
            indent: 37,
            endIndent: 37,
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const ListTile(
              leading: Icon(
                Icons.phone,
                size: 28,
                color: Color(0xff6c8090),
              ),
              title: Text(
                '(+20) 1220995086',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: 55,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.mail,
                    size: 28,
                    color: Color(0xff6c8090),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'ahmmeedhafez22@gmail.com',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
