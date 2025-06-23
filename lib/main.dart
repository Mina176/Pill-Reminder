import 'package:flutter/material.dart';
import 'package:pill_reminder/notification_service.dart';
import 'package:pill_reminder/utils.dart';
import 'package:pill_reminder/views/homeView/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveBox();
  NotificationService().initNotification();
  runApp(const PillReminder());
}

class PillReminder extends StatelessWidget {
  const PillReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Nunito'),
        home: HomeView());
  }
}
