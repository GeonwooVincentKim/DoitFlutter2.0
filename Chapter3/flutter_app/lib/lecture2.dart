import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_app/lecture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _counter = 0;
  int _counter2 = 0;
  final colors  = [Colors.orange, Colors.pink, Colors.blue];
  bool isChecked = false;

  void _incrementCounter() {
      _counter++;
      print('_counter=$_counter');
      setState(() {
      });
  }

  void _incrementCounter2() {
    _counter2++;
    print('_counter2=$_counter2');
  }

  @override
  Widget build(BuildContext context) {
    print('빌드가 수행되었어요');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, //MaterialColor타입으로 선언되어 있는 색깔만 사용할 수 있다
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Container(width: 100, height: 100, color: colors[Random().nextInt(colors.length)],),
              //SizedBox(height: 30),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                '$_counter2',
                style: Theme.of(context).textTheme.headline4,
              ),
              //const SizedBox(height: 30),
              //Checkbox(
              //  value: isChecked,
              //  onChanged: (bool? value) {
              //    setState(() {
              //      isChecked = value!;
              //    });
              //  },
              //),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter2,
              tooltip: 'Increment2',
              child: const Icon(Icons.add),
            ),
          ],
        )
      ),
    );
  }
}