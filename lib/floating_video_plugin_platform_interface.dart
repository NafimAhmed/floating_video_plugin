import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'floating_video_plugin_method_channel.dart';

abstract class FloatingVideoPluginPlatform extends PlatformInterface {
  /// Constructs a FloatingVideoPluginPlatform.
  FloatingVideoPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FloatingVideoPluginPlatform _instance = MethodChannelFloatingVideoPlugin();

  /// The default instance of [FloatingVideoPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFloatingVideoPlugin].
  static FloatingVideoPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FloatingVideoPluginPlatform] when
  /// they register themselves.
  static set instance(FloatingVideoPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
