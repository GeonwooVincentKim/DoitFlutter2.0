import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int _counter = 0;
  final colors  = [Colors.orange, Colors.pink, Colors.blue];
  bool isChecked = false;

  MyApp({Key? key}) : super(key: key);
  void _incrementCounter() {
    _counter++;
    print('_counter=$_counter');
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
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}