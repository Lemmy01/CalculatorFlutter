import 'package:desktop_math/core/consts.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.grey.withAlpha(100),
        content: Text(message),
      ),
    );
  }
}
