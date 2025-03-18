// import 'dart:developer';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// enum Environment {
//   development('development'),
//   staging('staging'),
//   production('production');
//
//   final String value;
//
//   const Environment(this.value);
// }
//
// enum Flavor {
//   dev('.env.development'),
//   staging('.env.staging'),
//   prod('.env.production');
//
//   final String value;
//
//   const Flavor(this.value);
// }
//
// class Env {
//   Future loadEnv() async {
//     const flavorString = String.fromEnvironment('flavor', defaultValue: 'dev');
//     final flavor = Flavor.values.firstWhere(
//       (f) {
//         var dataFlavor = "";
//         if (flavorString == "dev" || flavorString == "development") {
//           dataFlavor = "dev";
//         } else if (flavorString == "staging") {
//           dataFlavor = "staging";
//         } else if (flavorString == "prod" || flavorString == "production") {
//           dataFlavor = "prod";
//         }
//         return f.name == dataFlavor;
//       },
//       orElse: () => Flavor.dev,
//     );
//     await dotenv.load(fileName: flavor.value);
//     if (kDebugMode) {
//       log("\n:: RUNNING ON :: ${dotenv.env['APP_ENV']?.toUpperCase()} MODE");
//     }
//   }
//
//   static String get env =>
//       dotenv.env['APP_ENV'] ?? Environment.development.value;
//
//   static bool banner() {
//     return dotenv.env['APP_ENV'] == Environment.production.value ? false : true;
//   }
// }
