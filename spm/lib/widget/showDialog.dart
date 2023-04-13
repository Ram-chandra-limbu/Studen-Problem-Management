import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showErrorMessage(
  BuildContext context, {
  required String message,
  required String errorType,
}) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            errorType,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Try again"))
          ],
        ),
      ) ??
      false;
}
