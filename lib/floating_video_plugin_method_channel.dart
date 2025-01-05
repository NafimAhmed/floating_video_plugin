import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'floating_video_plugin_platform_interface.dart';

/// An implementation of [FloatingVideoPluginPlatform] that uses method channels.
class MethodChannelFloatingVideoPlugin extends FloatingVideoPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('floating_video_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
