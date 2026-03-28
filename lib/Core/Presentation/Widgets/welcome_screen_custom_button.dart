import 'package:flutter/material.dart';

class WelcomeScreenCustomButton extends StatelessWidget {
  const WelcomeScreenCustomButton({super.key, required this.routeName, required this.bgColor, required this.txtColor, required this.text});
  final String routeName;
  final Color bgColor;
  final Color txtColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, routeName),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(336, 45),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Colors.white, width: 2),
      ),
      child:  Text(
        text,
        style: TextStyle(
          color: txtColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}