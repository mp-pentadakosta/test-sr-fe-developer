import 'dart:async';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/env/flavors.dart';
import 'di/di.dart';

FutureOr<void> main() async {
  await F().loadEnv();
  setUpDi();
  runApp(const App());
}
