import 'package:flutter/material.dart';

class FunctionsHelper {
  // 1. Show SnackBar Helper
  static void showSnackBar(
    BuildContext context, {
    required String message,
    bool isError = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // 2. التحقق من صحة الإيميل (مثال لميثود تانية تقدري تضيفيها هنا)
  static bool isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  // 3. دالة لعرض Loading Dialog (لو مش عايزة تستخدمي الـ State في زرار معين)
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
