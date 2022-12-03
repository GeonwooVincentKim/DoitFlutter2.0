import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Counter with ChangeNotifier {
  int _counter = 0;
  void increment() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Counter())
      ],
      child: const MaterialApp(
        title: 'Counter',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );

  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'MyHomePage',
                style: TextStyle(fontSize: 24.0)
              ),
            ),
            const SizedBox(height: 20.0),
            CounterA(),
            const SizedBox(height: 20.0),
            Middle(),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget{
  CounterA({super.key});

  @override
  Widget build(BuildContext context) {
    print('CounterA rebuild');
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('${context.watch<Counter>()._counter}', style: const TextStyle(fontSize: 48.0),),
          ElevatedButton(
              onPressed: context.read<Counter>().increment,
              child: const Text('Increment', style: TextStyle(fontSize: 20.0),)
          )
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  Middle({super.key});

  @override
  Widget build(BuildContext context) {
    print('Middle rebuild');
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterB(),
          const SizedBox(width: 20.0),
          const Sibling()
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  CounterB({super.key});

  @override
  Widget build(BuildContext context) {
    print('CounterB rebuild');
    return Row(
      children: [
        SiblingText('build test'),
        Container(
          color: Colors.yellow[100],
          padding: const EdgeInsets.all(10.0),
          child:
            Consumer<Counter>(
              builder: (_, counter, __) => Text('${counter._counter}', style: const TextStyle(fontSize: 24.0),),
            ),
            // Text('${counter._counter}', style: const TextStyle(fontSize: 24.0),),
        )
      ],
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10.0),
      child: Text('Sibling', style: TextStyle(fontSize: 24.0)),
    );
  }
}

class SiblingText extends Text {
  SiblingText(super.data);

  @override
  Widget build(BuildContext context) {
    print('SiblingText rebuild');
    return super.build(context);
  }
}