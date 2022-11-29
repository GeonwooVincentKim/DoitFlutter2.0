import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Counter',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

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
            CounterA(counter:_counter, increment: increment),
            const SizedBox(height: 20.0),
            Middle(counter:_counter),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget{
  int counter;
  void Function() increment;

  CounterA({super.key, required this.counter, required this.increment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('$counter', style: const TextStyle(fontSize: 48.0),),
          ElevatedButton(
              onPressed: increment,
              child: const Text('Increment', style: TextStyle(fontSize: 20.0),)
          )
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  int counter;
  Middle({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterB(counter:counter),
          const SizedBox(width: 20.0),
          const Sibling()
        ],
      ),
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
      child: const Text(
        'Sibling',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  int counter;

  CounterB({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10.0),
      child: Text('$counter', style: const TextStyle(fontSize: 24.0),),
    );
  }

}

