import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFBF8),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: HomeViewBody(),
      )),
    );
  }
}
