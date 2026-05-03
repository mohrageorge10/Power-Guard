import 'package:flutter/material.dart';
import 'package:power_guard/Core/Constants/app_colors.dart';

class AuthQuestion extends StatelessWidget {
<<<<<<< HEAD
  const AuthQuestion({super.key, required this.question, required this.action, required this.onTap});
=======
  const AuthQuestion({
    super.key,
    required this.question,
    required this.action,
    required this.onTap,
  });
>>>>>>> api
  final String question;
  final String action;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
<<<<<<< HEAD
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
=======
      child: Wrap(
        alignment: WrapAlignment.center,
>>>>>>> api
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textPrimaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              action,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0XFF0EA5E9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
