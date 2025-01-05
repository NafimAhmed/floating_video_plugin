#ifndef FLUTTER_PLUGIN_FLOATING_VIDEO_PLUGIN_H_
#define FLUTTER_PLUGIN_FLOATING_VIDEO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace floating_video_plugin {

class FloatingVideoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FloatingVideoPlugin();

  virtual ~FloatingVideoPlugin();

  // Disallow copy and assign.
  FloatingVideoPlugin(const FloatingVideoPlugin&) = delete;
  FloatingVideoPlugin& operator=(const FloatingVideoPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace floating_video_plugin

#endif  // FLUTTER_PLUGIN_FLOATING_VIDEO_PLUGIN_H_
