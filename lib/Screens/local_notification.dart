import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final onClicknotification = BehaviorSubject<String>();
  static void onnotificationtap(NotificationResponse notificationResponse) {
    onClicknotification.add(notificationResponse.payload!);
  }

  //init plugin
  static Future<void> init() async {
    // Initialise the plugin. app_icon needs to be added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
      // Handle receiving local notification on iOS (Darwin)
      // You can customize how you want to handle this event
    );
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onnotificationtap,
        onDidReceiveBackgroundNotificationResponse: onnotificationtap);
  }

  //show notification simple

  static Future showaimblenotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  //periodic
  // static Future<void> showPeriodic({
  //   required String title,
  //   required String body,
  //   required String payload,
  // }) async {
  //   const AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails('channel 2', 'your channel name',
  //           channelDescription: 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ticker: 'ticker');
  //   const NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);

  //   const RepeatInterval repeatInterval = RepeatInterval.everyMinute;

  //   await _flutterLocalNotificationsPlugin.periodicallyShow(
  //       1, title, body, repeatInterval, notificationDetails,
  //       payload: payload);
  // }

  ///sheduled
  // static Future<void> shownotification({
  //   required String title,
  //   required String boady,
  //   required String payload,
  // }) async {
  //   try {
  //     tz.initializeTimeZones();
  //     await _flutterLocalNotificationsPlugin.zonedSchedule(
  //         2,
  //         title,
  //         boady,
  //         tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
  //         const NotificationDetails(
  //             android: AndroidNotificationDetails(
  //                 'channel 2', 'your channel name',
  //                 channelDescription: 'your channel description',
  //                 importance: Importance.max,
  //                 priority: Priority.high,
  //                 ticker: 'ticker')),
  //         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //         uiLocalNotificationDateInterpretation:
  //             UILocalNotificationDateInterpretation.absoluteTime,
  //         payload: payload);
  //   } catch (e, stacktrace) {
  //     print("Error scheduling notification: $e");
  //     print(stacktrace);
  //   }
  // }
}
