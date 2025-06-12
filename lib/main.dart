import 'package:flutter/material.dart';
import 'views/homeView/home_view.dart';

void main() {
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
