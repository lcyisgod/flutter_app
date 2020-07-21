import UIKit
import Flutter

@UIApplicationMain

@objc class AppDelegate: FlutterAppDelegate,FlutterStreamHandler {
    
    var eventSink: FlutterEventSink?
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil;
        return nil
    }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let controller = self.window.rootViewController
        let batteryChanel = FlutterMethodChannel.init(name: "samples.flutter.io/battery", binaryMessenger: controller as! FlutterBinaryMessenger)

        batteryChanel.setMethodCallHandler { (call:FlutterMethodCall, result:FlutterResult) -> Void
            in
            if ("getBatteryLevel" == call.method) {
                self.getBatteryLevel(result: result)
            }else if ("showIosAlert" == call.method) {
                let dict:Dictionary = call.arguments as! Dictionary<String, Any>
                self.showAlert(dict: dict)
            }
            else {
                result(FlutterMethodNotImplemented);
            }
        }
        
        let eventChanel = FlutterEventChannel.init(name: "com.meetyou.flutter/event", binaryMessenger: controller as! FlutterBinaryMessenger)
        eventChanel.setStreamHandler(self)
          
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getBatteryLevel(result: FlutterResult)  {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == .unknown {
            result(FlutterError.init(code: "UNAVAILABLE", message: "Battery info unabailable", details: nil))
        }else {
            result(Int(device.batteryLevel*100))
        }
    }
    
    func showAlert(dict:Dictionary<String, Any>) -> Void {
        let controller = self.window.rootViewController
        let cancelAction = UIAlertAction.init(title: (dict["cancelTitle"] as! String), style: .cancel) { (action:UIAlertAction) in
            self.postMessage(title: "取消")
        }
        
        let ensureAction = UIAlertAction.init(title: (dict["ensureTitle"] as! String), style: .destructive) {
            (action:UIAlertAction) in
            self.postMessage(title: "确定")
        }
        
        let alertVc = UIAlertController.init(title: (dict["tipTitle"] as! String), message: (dict["message"] as! String), preferredStyle: .alert)
        alertVc.addAction(cancelAction)
        alertVc.addAction(ensureAction)
        
        controller?.present(alertVc, animated: true, completion: nil)
    }
    
    func postMessage(title:String) -> Void {
        if (self.eventSink != nil) {
            self.eventSink!(title)
        }
    }
}
