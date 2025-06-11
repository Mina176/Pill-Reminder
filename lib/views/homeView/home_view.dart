import 'package:flutter/material.dart';
import 'package:pill_reminder/views/homeView/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCF9),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
