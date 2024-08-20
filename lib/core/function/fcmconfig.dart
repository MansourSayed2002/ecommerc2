import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

permissionnotification() async {
  NotificationSettings permission =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (permission.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (permission.authorizationStatus ==
      AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print(message.notification!.title!);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });
}
