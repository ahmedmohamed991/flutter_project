import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String apparent_text;
  VoidCallback? onTap;
  CustomButton({this.onTap, required this.apparent_text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Center(child: Text(apparent_text)),
        width: double.infinity,
        height: 60,
      ),
    );
  }
}
