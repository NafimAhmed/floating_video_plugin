
import 'dart:async';
import 'package:flutter/services.dart';

class FloatingVideoPlugin {
  static const MethodChannel _channel = MethodChannel('floating_video_plugin');

  /// Launches the floating video
  static Future<void> startFloatingVideo(String videoUrl) async {
    try {
      await _channel.invokeMethod('startFloatingVideo', {"videoUrl": videoUrl});
    } on PlatformException catch (e) {
      throw 'Failed to start floating video: ${e.message}';
    }
  }
}
