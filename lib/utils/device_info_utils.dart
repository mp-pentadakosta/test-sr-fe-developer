import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtils {
  Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // ID unik untuk Android
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // ID unik untuk iOS
    }
    return null;
  }
}
