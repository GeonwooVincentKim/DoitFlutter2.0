package com.example.native_demo2

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "native.device"
        ).setMethodCallHandler {
                call, result ->
            when(call.method) {
                "getDeviceInfo" -> result.success(Build.DEVICE)
                else -> result.error("NotSupported", "지원하지 않는 기능", null);
            }
        }
    }
}
