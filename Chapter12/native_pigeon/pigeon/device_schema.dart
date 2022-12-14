import 'package:pigeon/pigeon.dart';

class DeviceInfo {
  String? device;
  String? brand;
}

@HostApi()
abstract class HostDeviceInfoService {
  DeviceInfo getDeviceInfo();
}