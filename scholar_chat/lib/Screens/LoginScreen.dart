import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Constants.dart';
import 'package:scholar_chat/Screens/RegisterScreen.dart';
import 'package:scholar_chat/components/custom_TextField.dart';
import 'package:scholar_chat/components/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: Form(
            key: formKey,
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
                CustomTextfield(
                    onChanged: (data) {
                      email = data;
                    },
                    HintText: 'Email'),
                SizedBox(
                  height: 13,
                ),
                CustomTextfield(
                    onChanged: (data) {
                      password = data;
                    },
                    HintText: 'Password'),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        snackbar(context, 'Login successful.✅');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          snackbar(context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          snackbar(context,
                              'Wrong password provided for that user.');
                        } else if (e.code == 'invalid-email') {
                          snackbar(context, 'The email address is not valid.');
                        } else {
                          snackbar(context,
                              'An unknown error occurred: ${e.message}');
                        }
                      } catch (e) {
                        snackbar(context, 'There was an error: $e');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
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
                        '    Register Now',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    if (email == null || password == null) {
      print('Email or Password is null');
      return;
    }
    await auth.signInWithEmailAndPassword(email: email!, password: password!);
  }
}
