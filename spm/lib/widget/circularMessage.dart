import 'package:flutter/material.dart';

class CircularMessage extends StatelessWidget {
  final String message;

  const CircularMessage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text("${message}")
          ],
        ),
      ),
    );
  }
}
