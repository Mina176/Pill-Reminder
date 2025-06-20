import 'package:timezone/data/latest_all.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    initializeTimeZones();
    setLocalLocation(getLocation('Africa/Cairo'));

    const androidSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showInstantNotification({
    required String title,
    required String body,
  }) async {
    await notificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'pill_reminder_channel',
          'Pill Reminder',
          channelDescription: 'Channel for pill reminder notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  Future<void> scheduledReminder({
    required int id,
    required String title,
    required String body,
  }) async {
    TZDateTime now = TZDateTime.now(local);
    TZDateTime subtractedTime = now.subtract(Duration(hours: 1));

    TZDateTime scheduledTime = subtractedTime.add(
      Duration(seconds: 1),
    );

    await notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'pill_reminder_channel',
            'Pill Reminder',
            channelDescription: 'Channel for pill reminder notifications',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);

    print('schedule pressed');
  }
}
