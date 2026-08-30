import 'package:flutter/material.dart';
import 'package:ecommerce/Screens/Constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.icon});
  final String hint;
  final IconData icon;
  String messageError(String str) {
    switch (hint) {
      case 'Enter Your Name ':
        return 'Name is empty !';
      case 'Enter Your Email':
        return 'Email is empty !';
      case 'Enter Your Password':
        return 'Password is empty !';
      default:
        return 'Field is empty !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return messageError(hint);
          }
        },
        cursorColor: kMaincolor,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kMaincolor),
          hintText: hint,
          filled: true,
          fillColor: KSeconderyColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: KSeconderyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: KSeconderyColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: KSeconderyColor),
          ),
        ),
      ),
    );
  }
}
