import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'hello Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue , fontSize: 20 ),
          ),
        ),
      ),
    );
  }
}
