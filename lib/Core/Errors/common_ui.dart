import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin CommonUi {
  static bool checkInternetShown = false;

  static simpleToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static snackBar(
    BuildContext context,
    String msg, {
    Color bgColor = Colors.black,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        backgroundColor: bgColor,
        duration: const Duration(milliseconds: 3000),
      ),
    );
  }
}
