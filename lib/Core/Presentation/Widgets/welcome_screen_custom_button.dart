import 'package:flutter/material.dart';

class WelcomeScreenCustomButton extends StatelessWidget {
<<<<<<< HEAD
  const WelcomeScreenCustomButton({super.key, required this.routeName, required this.bgColor, required this.txtColor, required this.text});
=======
  const WelcomeScreenCustomButton({
    super.key,
    required this.routeName,
    required this.bgColor,
    required this.txtColor,
    required this.text,
  });
>>>>>>> api
  final String routeName;
  final Color bgColor;
  final Color txtColor;
  final String text;
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: txtColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
>>>>>>> api
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> api
