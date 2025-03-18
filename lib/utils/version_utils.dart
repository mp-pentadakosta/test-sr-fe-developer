import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ModelVersion {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  ModelVersion({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  factory ModelVersion.fromJson(Map<String, dynamic> json) => ModelVersion(
        // listData: json['listData'],
        appName: json['appName'],
        buildNumber: json['buildNumber'],
        packageName: json['packageName'],
        version: json['version'],
      );

  Map<String, dynamic> toJson() => {
        'appName': appName,
        'buildNumber': buildNumber,
        'packageName': packageName,
        'version': version,
      };
}

class VersionUtils {
  Future<ModelVersion> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName; // Nama aplikasi
    String packageName = packageInfo.packageName; // ID paket (com.example.app)
    String version = packageInfo.version; // Versi aplikasi (misal: 1.0.0)
    String buildNumber = packageInfo.buildNumber; // Nomor build (misal: 5)

    if (kDebugMode) {
      print('App Name: $appName');
      print('Version: $version');
      print('Build Number: $buildNumber');
      print('Package Name: $packageName');
    }

    return ModelVersion(
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
    );
  }
}
