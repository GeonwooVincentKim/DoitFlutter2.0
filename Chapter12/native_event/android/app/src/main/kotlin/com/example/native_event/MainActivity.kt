package com.example.native_event

import io.flutter.embedding.android.FlutterActivity
import android.util.Log

import java.util.Objects

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel


class MainActivity: FlutterActivity() {
    val STREAM = "lotto"
    private var attachEvent: EventChannel.EventSink? = null
    val TAG_NAME = "From_Native"
    private var count = 1
    private var handler: Handler? = null

    private val runnable: Runnable = object : Runnable {
        override fun run() {
            val TOTAL_COUNT = 100
            if (count > TOTAL_COUNT) {
                attachEvent?.endOfStream()
            } else {
                val percentage = count.toDouble() / TOTAL_COUNT
                Log.w(TAG_NAME, "\nParsing From Native:  $percentage")
                attachEvent?.success(percentage)
            }
            count++
            handler?.postDelayed(this, 200)
        }
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        EventChannel(flutterEngine?.dartExecutor,
            STREAM
        ).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink?) {
                    Log.w(TAG_NAME, "Adding listener")
                    attachEvent = events
                    count = 1
                    handler = Looper.myLooper()?.let { Handler(it) }
                    runnable.run()
                }

                override fun onCancel(args: Any?) {
                    Log.w(TAG_NAME, "Cancelling listener")
                    handler?.removeCallbacks(runnable)
                    handler = null
                    count = 1
                    attachEvent = null
                    println("StreamHandler - onCanceled: ")
                }
            }
        )
    }

    override fun onDestroy() {
        super.onDestroy()
        handler?.removeCallbacks(runnable)
        handler = null
        attachEvent = null
    }
}
