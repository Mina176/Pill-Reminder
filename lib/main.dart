import 'package:flutter/material.dart';

import 'Features/AddMedication/presentation/views/add_med_view.dart';
import 'Features/Home/presentation/views/home_view.dart';

void main() {
  runApp(const PillReminder());
}

class PillReminder extends StatelessWidget {
  const PillReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddMedView(),
    );
  }
}
