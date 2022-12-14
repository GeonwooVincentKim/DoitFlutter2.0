import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_pigeon/deviceInfoService.dart';

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
      home: DeviceInfoWidget(),
    );
  }
}

class DeviceInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeviceInfoState();
  }
}

class _DeviceInfoState extends State<DeviceInfoWidget> {
  String _deviceInfo = 'unknown device';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('device info'),),
      body: Container(
        child: Center(
          child: Text(_deviceInfo),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            getDeviceInfo();
          },
          child: Icon(Icons.card_membership)
      ),
    );
  }

  var deviceInfoService = HostDeviceInfoService();

  Future<void> getDeviceInfo() async {
    String result;
    try {
      var deviceInfo = await deviceInfoService.getDeviceInfo();
      result = '${deviceInfo.brand!}:${deviceInfo.device!}';
    } on MissingPluginException catch(e) {
      result = 'failed to missing plugin, message : ${e.message}';
    } on PlatformException catch (e) {
      result = 'failed to execute native code, message : ${e.message}';
    }

    setState((){
      _deviceInfo = result;
    });
  }
}
