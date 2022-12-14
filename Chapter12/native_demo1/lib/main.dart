import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: NativeApp(),
    );
  }
}

class NativeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeApp();
  }
}

class _NativeApp extends State<NativeApp>{
  static const platform = const MethodChannel('com.flutter.dev/info');
  String _deviceInfo = 'Unknown info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Native demo1'),),
      body: Container(
        child: Center(
          child: Text(_deviceInfo, style: TextStyle(fontSize: 30),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getDeviceInfo();
        },
        child: Icon(Icons.get_app),
      ),
    );
  }

  Future<void> _getDeviceInfo() async {
    String deviceInfo;

    try {
      final String result = await platform.invokeMethod('getDeviceInfo');
      deviceInfo = 'Device info : $result';
    } on MissingPluginException catch (e) {
      deviceInfo = 'Failed to invoke method : ${e.message}';
    } on PlatformException catch (e) {
    deviceInfo = 'Failed to get Device info : ${e.message}';
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }
}
