import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

GMSServices.provideAPIKey("AIzaSyDTG4sNpOS-j9qXrGnxHnQRCv2etscpnIE")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
