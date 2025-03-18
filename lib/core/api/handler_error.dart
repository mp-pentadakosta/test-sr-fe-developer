import 'package:flutter/material.dart';

import '../../app.dart';
import '../shared/shared_preferences.dart';

class HandlerError {
  Future<void> handlerError(String message, int statusCode) async {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        closeIconColor: Colors.white,
        showCloseIcon: true,
      ),
    );
  }

  void redirectErrorUnauthorized() {
    IStorage.removeAllData();
    // appRouter.replace(const LoginRoute());
  }
}
