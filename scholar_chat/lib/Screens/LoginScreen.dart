import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scholar_chat/Constants.dart';
import 'package:scholar_chat/Screens/RegisterScreen.dart';
import 'package:scholar_chat/components/custom_TextField.dart';
import 'package:scholar_chat/components/custom_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextfield(HintText: 'Email'),
            SizedBox(
              height: 13,
            ),
            CustomTextfield(HintText: 'Password'),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              apparent_text: 'Login',
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t Have an Account?',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Registerscreen.id);
                  },
                  child: Text(
                    '    Register Naw',
                    style: TextStyle(color: Color(0xffC7EDE6)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Arial {}
