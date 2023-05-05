import 'package:flutter/material.dart';

class verdenun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Center(
          child: SizedBox(
            width: 100,
            child: Image.asset("local.png"),
          ),
        ),
      ),
    );
  }
}