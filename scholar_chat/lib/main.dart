import 'package:flutter/material.dart';
import 'package:scholar_chat/Screens/LoginScreen.dart';
import 'package:scholar_chat/Screens/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Scholar_chat());
}

class Scholar_chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        Registerscreen.id: (contex) => Registerscreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginScreen',
    );
  }
}
