import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  dev('.env.development'),
  staging('.env.staging'),
  prod('.env.production');

  final String value;

  const Flavor(this.value);
}

enum Environment {
  development('development'),
  staging('staging'),
  production('production');

  final String value;

  const Environment(this.value);
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return dotenv.env['ENV'] ?? '';
      case Flavor.staging:
        return dotenv.env['ENV'] ?? '';
      case Flavor.prod:
        return dotenv.env['ENV'] ?? '';
      default:
        return '';
    }
  }

  Future loadEnv() async {
    final flavor = appFlavor ?? Flavor.dev;
    await dotenv.load(fileName: flavor.value);
    if (kDebugMode) {
      log("\n:: RUNNING ON :: ${dotenv.env['ENV']?.toUpperCase()} MODE");
    }
  }

  static String get env => dotenv.env['ENV'] ?? Environment.development.value;

  static bool banner() {
    return dotenv.env['ENV'] == Environment.production.value ? false : true;
  }
}
