import 'package:ecommerce/Screens/LoginScreen.dart';
import 'package:ecommerce/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';

main() => runApp(EcommerceApp());

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loginscreen.id,
      routes: {
        Loginscreen.id: (context) => Loginscreen(),
        Signupscreen.id: (context) => Signupscreen(),
      },
    );
  }
}
