import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();

  // @override
  // State<StatefulWidget> createState() {
  //   print('createState');
  //   return _MyApp();
  // }
}

class _MyApp extends State<MyApp> {
  var switchValue = false;
  String test = 'hello'; // 버튼에 들어갈 텍스트 입력
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactiveate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(_color)),
                onPressed: () {
                  if (_color == Colors.blue) {
                    if(mounted) {
                      setState(() {
                        test = 'flutter';
                        _color = Colors.amber;
                      });
                    }
                  } else {
                    if(mounted) {
                      setState(() {
                        test = 'flutter';
                        _color = Colors.blue;
                      });
                    }
                  }
                },
                child: Text(test)),
          ),
        ));
  }
}
