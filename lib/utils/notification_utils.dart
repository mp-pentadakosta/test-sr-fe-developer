import '../../core/shared/shared_preferences.dart';
import '../../shared/constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class NotificationUtils {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  /// Background message handler (perlu di luar class untuk Firebase)
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    if (kDebugMode) {
      print('Handling background message: ${message.messageId}');
    }
  }

  /// Request permission untuk iOS
  Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      if (kDebugMode) {
        print('User denied permission');
      }
      openAppSettings();
    }
  }

  /// Check dan request permission untuk Android 13+
  Future<void> checkAndroidPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }
  }

  /// Get Firebase Cloud Messaging (FCM) Token
  Future<void> getToken() async {
    await checkAndroidPermission();
    if (Platform.isIOS) {
      String? apnsToken = await _firebaseMessaging.getAPNSToken();
      if (kDebugMode) {
        print('APNS Token: $apnsToken');
      }
      await Future.delayed(const Duration(seconds: 2));
    }
    String? token = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('🔥 FCM Token: $token');
    }

    if (token != null) {
      await IStorage.setDataString(IConstantData.notificationToken, token);
    }
  }

  /// Initialize Firebase Messaging dan Local Notifications
  Future<void> initializeNotifications() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    await requestPermission();
    await checkAndroidPermission();

    // Konfigurasi Foreground Notification untuk iOS
    if (Platform.isIOS) {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    // Handling notifikasi saat aplikasi aktif
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('📩 Received foreground message: ${message.notification?.title}');
      }
      if (Platform.isAndroid) {
        // _showLocalNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('📌 User tapped notification: ${message.notification?.title}');
      }
    });

    // Konfigurasi Local Notification
    // const AndroidInitializationSettings androidInitSettings =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    //
    // const InitializationSettings initSettings = InitializationSettings(
    //   android: androidInitSettings,
    //   iOS: DarwinInitializationSettings(),
    // );

    // await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  /// Menampilkan local notification di foreground
  // Future<void> _showLocalNotification(RemoteMessage message) async {
  //   const AndroidNotificationDetails androidDetails =
  //       AndroidNotificationDetails(
  //     'channel_id',
  //     'channel_name',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     playSound: true,
  //   );
  //
  //   const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
  //
  //   const NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidDetails, iOS: iosDetails);
  //
  //   await _flutterLocalNotificationsPlugin.show(
  //     0,
  //     message.notification?.title ?? 'No Title',
  //     message.notification?.body ?? 'No Body',
  //     notificationDetails,
  //   );
  // }
}
