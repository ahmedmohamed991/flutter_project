import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Constants.dart';
import 'package:scholar_chat/Screens/LoginScreen.dart';
import 'package:scholar_chat/components/custom_TextField.dart';
import 'package:scholar_chat/components/custom_button.dart';

class Registerscreen extends StatefulWidget {
  @override
  static String id = 'RegisterScreen';

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  String? email;

  String? Password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

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
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Text(
                      'Register',
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
                      Password = data;
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
                        await registerUser();
                        snackbar(context, 'Registration successful.✅');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          snackbar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          snackbar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        snackbar(context, 'there  was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  apparent_text: 'Register',
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an Account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '    Login',
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
    ;
  }

  void snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    if (email == null || Password == null) {
      print('Email or Password is null');
      return;
    }
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: Password!);
  }
}
