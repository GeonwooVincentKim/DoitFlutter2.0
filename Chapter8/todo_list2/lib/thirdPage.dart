import 'package:flutter/material.dart';

class ThirdDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: Text('Third Page'),),
      body: Container(
        child: Center(
          child: Text(args, style: TextStyle(fontSize: 30),)
        ),
      ),
    );
  }
}