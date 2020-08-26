
import 'package:hawkers/Widgets/errorDialog.dart';
import 'package:flutter/material.dart';

class Global {
  static void showErrorDialog(context, String title, String message) {
    showDialog(
      context: context,
      child: ErrorDialog(
        title: title,
        message: message,
      ),
    );
  }
}