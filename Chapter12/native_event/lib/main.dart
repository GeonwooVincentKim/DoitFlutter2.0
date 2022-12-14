import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const stream = EventChannel('lotto');

  late StreamSubscription _streamSubscription;
  double _currentValue = 0.0;

  void _startListener() {
    _streamSubscription = stream.receiveBroadcastStream().listen(_listenStream);
  }

  void _cancelListener() {
    _streamSubscription.cancel();
    setState(() {
      _currentValue = 0;
    });
  }

  void _listenStream(value) {
    debugPrint("Received From Native:  $value\n");
    setState(() {
      _currentValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Progress bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: _currentValue,
                backgroundColor: Colors.blue.shade50,
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            // Value in text
            Text("Received Stream From Native:  $_currentValue".toUpperCase(),
                textAlign: TextAlign.justify),
            const SizedBox(
              height: 50,
            ),

            //Start Btn
            TextButton(
              onPressed: () => _startListener(),
              child: Text("Start Counter".toUpperCase()),
            ),
            const SizedBox(
              height: 50,
            ),

            //Cancel Btn
            TextButton(
              onPressed: () => _cancelListener(),
              child: Text("Cancel Counter".toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}