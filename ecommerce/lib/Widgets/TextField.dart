import 'package:flutter/material.dart';
import 'package:ecommerce/Screens/Constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.icon});
  final String hint;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: TextField(
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
        ),
      ),
    );
  }
}
