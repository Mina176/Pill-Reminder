import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/views/addDoseVew/add_dose_view.dart';
import 'package:pill_reminder/views/homeView/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCF9),
      floatingActionButton: FloatingActionButton(),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}

class FloatingActionButton extends StatelessWidget {
  const FloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDoseView(),
            ),
          );
        },
        icon: Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
