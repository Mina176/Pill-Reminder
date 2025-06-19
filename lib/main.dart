import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'constants.dart';
import 'views/homeView/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveBox();
  runApp(const PillReminder());
}

Future<void> initHiveBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TimeAdapter());
  Hive.registerAdapter(DoseModelAdapter());
  await Hive.openBox<DoseModel>(kDoseBox);
}

class PillReminder extends StatelessWidget {
  const PillReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: HomeView(),
    );
  }
}
