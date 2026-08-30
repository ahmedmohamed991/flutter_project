import 'package:ecommerce/Screens/Constants.dart';
import 'package:ecommerce/Screens/SignupScreen.dart';
import 'package:ecommerce/Widgets/TextField.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  static String id = 'Loginscreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMaincolor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: MediaQuery.of(context).size.height * .17,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/icons/buyIcon.png',
                    width: 100,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      'Buy it',
                      style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: hight * .1),
          CustomTextField(hint: 'Enter Your Email', icon: Icons.email),
          SizedBox(height: hight * .02),
          CustomTextField(hint: 'Enter Your Password', icon: Icons.password),
          SizedBox(height: hight * .05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                print('Button Clicked');
              },
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: hight * .05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Signupscreen.id);
                },
                child: Text('Signup', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
