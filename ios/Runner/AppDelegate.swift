import UIKit
import Flutter
import CoreBluetooth 

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "your_channel_name"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "enableBluetooth" {
                self?.enableBluetooth(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  private func enableBluetooth(result: FlutterResult) {
        if let centralManager = CBCentralManager(delegate: nil, queue: nil) {
            if centralManager.state == .poweredOn {
                result(FlutterError(code: "BLUETOOTH_ALREADY_ENABLED", message: "Bluetooth is already enabled", details: nil))
            } else {
                let alertController = UIAlertController(title: "Enable Bluetooth", message: "Please enable Bluetooth in Settings", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                if let viewController = window?.rootViewController {
                    viewController.present(alertController, animated: true, completion: nil)
                }
                result(nil)
            }
        } else {
            result(FlutterError(code: "BLUETOOTH_NOT_SUPPORTED", message: "Device does not support Bluetooth", details: nil))
        }
    }
}
