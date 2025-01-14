

import 'package:flutter/material.dart';
import 'package:floating_video_plugin/floating_video_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Floating Video Plugin')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              FloatingVideoPlugin.startFloatingVideo('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
            },
            child: Text('Launch Floating Video'),
          ),
        ),
      ),
    );
  }
}
