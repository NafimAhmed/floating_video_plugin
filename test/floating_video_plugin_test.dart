import 'package:flutter_test/flutter_test.dart';
import 'package:floating_video_plugin/floating_video_plugin.dart';
import 'package:floating_video_plugin/floating_video_plugin_platform_interface.dart';
import 'package:floating_video_plugin/floating_video_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFloatingVideoPluginPlatform
    with MockPlatformInterfaceMixin
    implements FloatingVideoPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FloatingVideoPluginPlatform initialPlatform = FloatingVideoPluginPlatform.instance;

  test('$MethodChannelFloatingVideoPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFloatingVideoPlugin>());
  });

  test('getPlatformVersion', () async {
    FloatingVideoPlugin floatingVideoPlugin = FloatingVideoPlugin();
    MockFloatingVideoPluginPlatform fakePlatform = MockFloatingVideoPluginPlatform();
    FloatingVideoPluginPlatform.instance = fakePlatform;

    expect(await floatingVideoPlugin.getPlatformVersion(), '42');
  });
}
