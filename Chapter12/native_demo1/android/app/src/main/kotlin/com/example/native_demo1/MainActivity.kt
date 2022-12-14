package com.example.native_demo1

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.flutter.dev/info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler{
                call, result ->
                    when(call.method) {
                        "getDeviceInfo" -> result.success(getDeviceInfo())
                        else -> {
                            result.error("ERROR_UNSUPPORTED_OPERATION", "un supported method(" + call.method+")", null )
                        }
                    }
            }
    }

    private fun getDeviceInfo(): String {
        return StringBuilder()
            .append(Build.DEVICE).append('\n')
            .append(Build.BRAND).append('\n')
            .append(Build.MODEL).toString();
    }
}