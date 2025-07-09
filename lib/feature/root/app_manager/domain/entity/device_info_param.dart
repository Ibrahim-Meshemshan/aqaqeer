// class DeviceInfoParam {
//    String deviceName = 'relme';
//   late final String deviceModel;
//   late final String deviceManufacturer;
//   late final String deviceSystemVersion;
//   late final String deviceLanguage;
//   late final String devicePlatform;
//   late final int deviceSdkInt;
//   late final double screenPixelRatio;
//   late final double screenHeight;
//   late final double screenWidth;
//
//   Future<void> initializeDeviceInfo() async {
//     // Replace this with your actual implementation (e.g., using device_info_plus or similar package)
//     deviceName ;
//     deviceModel ;
//     deviceManufacturer ;
//     deviceSystemVersion ;
//     deviceLanguage ;
//     devicePlatform ;
//     deviceSdkInt ;
//     screenPixelRatio ;
//     screenHeight ;
//     screenWidth ;
//   }
// }
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';

class DeviceInfoParam {
  String deviceName = 'realme';
  String deviceModel = 'Unknown';
  String deviceManufacturer = 'Unknown';
  String deviceSystemVersion = 'Unknown';
  String deviceLanguage = 'ar';
  String devicePlatform = 'Unknown';
  int deviceSdkInt = 0;
  double screenPixelRatio = 1.0;
  double screenHeight = 0.0;
  double screenWidth = 0.0;

  Future<void> initializeDeviceInfo() async {
    try {
      final deviceInfo = await DeviceInfoPlugin().deviceInfo;

      if (deviceInfo is AndroidDeviceInfo) {
        deviceModel = deviceInfo.model;
        deviceManufacturer = deviceInfo.manufacturer;
        deviceSystemVersion = deviceInfo.version.release;
        devicePlatform = 'Android';
        deviceSdkInt = deviceInfo.version.sdkInt;
      } else if (deviceInfo is IosDeviceInfo) {
        deviceModel = deviceInfo.model;
        deviceManufacturer = 'Apple';
        deviceSystemVersion = deviceInfo.systemVersion;
        devicePlatform = 'iOS';
        deviceSdkInt = int.tryParse(deviceInfo.systemVersion.split('.').first) ?? 0;
      }

      final mediaQuery = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
      screenPixelRatio = mediaQuery.devicePixelRatio;
      screenHeight = mediaQuery.size.height;
      screenWidth = mediaQuery.size.width;
    } catch (e) {
      debugPrint('Error initializing device info: $e');
    }
  }
}