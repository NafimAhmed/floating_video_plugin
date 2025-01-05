#include "include/floating_video_plugin/floating_video_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "floating_video_plugin.h"

void FloatingVideoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  floating_video_plugin::FloatingVideoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
