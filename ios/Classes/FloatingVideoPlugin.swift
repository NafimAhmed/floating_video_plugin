import Flutter
import UIKit
import AVKit

public class FloatingVideoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "floating_video_plugin", binaryMessenger: registrar.messenger())
        let instance = FloatingVideoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "startFloatingVideo" {
            if let args = call.arguments as? [String: Any],
               let videoUrl = args["videoUrl"] as? String {
                startPictureInPicture(videoUrl: videoUrl)
                result(nil)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Video URL is required", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func startPictureInPicture(videoUrl: String) {
        guard let url = URL(string: videoUrl) else { return }
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)

        if AVPictureInPictureController.isPictureInPictureSupported() {
            let pipController = AVPictureInPictureController(playerLayer: playerLayer)
            pipController?.startPictureInPicture()
            player.play()
        }
    }
}

