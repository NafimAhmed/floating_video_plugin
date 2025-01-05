package com.example.floating_video_plugin

//package com.example.floating_video_plugin

import android.app.PictureInPictureParams
import android.content.Context
import android.os.Build
import android.util.Rational
import android.widget.VideoView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FloatingVideoPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "floating_video_plugin")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "startFloatingVideo") {
      val videoUrl = call.argument<String>("videoUrl")
      startPictureInPicture(videoUrl)
      result.success(null)
    } else {
      result.notImplemented()
    }
  }

  private fun startPictureInPicture(videoUrl: String?) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && videoUrl != null) {
      val videoView = VideoView(context)
      videoView.setVideoPath(videoUrl)
      videoView.start()

      val aspectRatio = Rational(16, 9)
      val params = PictureInPictureParams.Builder()
        .setAspectRatio(aspectRatio)
        .build()
      (context as? android.app.Activity)?.enterPictureInPictureMode(params)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}


