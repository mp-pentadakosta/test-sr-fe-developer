import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/api/api.dart';

GetIt getIt = GetIt.instance;

void setUpDi() {
  getIt.registerSingleton<Api>(Api([]));
  getIt.registerSingleton<Dio>(Dio());
}
