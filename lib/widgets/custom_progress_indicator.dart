import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      strokeWidth: 2,
      // valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }
}
