import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseVew/add_dose_view.dart';
import 'package:pill_reminder/views/detailsView/detalis_view.dart';
import 'constants.dart';
import 'views/homeView/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DoseModelAdapter());
  await Hive.openBox<DoseModel>(kDoseBox);

  runApp(const PillReminder());
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
