import 'package:flutter/material.dart';

class mural extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Center(
          child: SizedBox(
            width: 130,
            child: Image.asset("local.png"),
          ),
        ),
      ),
    );
  }
}
