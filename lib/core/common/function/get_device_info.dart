import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';

import '../../../feature/root/app_manager/domain/entity/device_info_param.dart';
import '../../injection/injection.dart';

Future<void> getDeviceInfo() async {
  final deviceInfoService = locator.get<DeviceInfoParam>();
  final deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      deviceInfoService.deviceName = '' ; //androidInfo.device
      deviceInfoService.deviceModel = androidInfo.model;
      deviceInfoService.deviceManufacturer = androidInfo.manufacturer;
      deviceInfoService.deviceSystemVersion = androidInfo.version.release;
      deviceInfoService.devicePlatform = 'Android';
      deviceInfoService.deviceSdkInt = androidInfo.version.sdkInt;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      deviceInfoService.deviceName = '' ; //iosInfo.name
      deviceInfoService.deviceModel = iosInfo.model;
      deviceInfoService.deviceManufacturer = 'Apple';
      deviceInfoService.deviceSystemVersion = iosInfo.systemVersion;
      deviceInfoService.devicePlatform = 'iOS';
      deviceInfoService.deviceSdkInt =
          int.tryParse(iosInfo.systemVersion.split('.').first) ?? 0;
    }

    // Additional common properties
    // Fetch screen size and pixel ratio using PlatformDispatcher
    final platformDispatcher = PlatformDispatcher.instance;
    final physicalSize = platformDispatcher.views.first.physicalSize;
    final pixelRatio = platformDispatcher.views.first.devicePixelRatio;

    deviceInfoService.screenPixelRatio = pixelRatio;
    deviceInfoService.screenHeight = physicalSize.height;
    deviceInfoService.screenWidth = physicalSize.width;
    // deviceInfoService.deviceLanguage = Platform.localeName.split('_').first;
  } catch (e) {
    log('Error collecting device info: $e');
    throw Exception('Failed to collect device info');
  }

  log('Device info initialized successfully.');
}
