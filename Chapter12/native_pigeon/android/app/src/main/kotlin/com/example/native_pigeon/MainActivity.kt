package com.example.native_pigeon

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.DeviceInfoService.DeviceInfo
import io.flutter.plugins.DeviceInfoService.HostDeviceInfoService

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        HostDeviceInfoService.setup(
            flutterEngine!!.dartExecutor.binaryMessenger
        ) {
            DeviceInfo.Builder()
                .setDevice(Build.DEVICE)
                .setBrand(Build.BRAND)
                .build()
        }
    }
}
