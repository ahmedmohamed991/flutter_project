import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({this.onChanged, this.HintText});
  String? HintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextFormField(
        validator: (Data) {
          if (Data!.isEmpty) {
            return 'Field Is Required';
          }
        },
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter a password';
        //   } else if (value.length < 6) {
        //     return 'Password must be at least 6 characters long';
        //   }
        //   return null;
        // },
        onChanged: onChanged,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: HintText,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder()),
      ),
    );
  }
}
