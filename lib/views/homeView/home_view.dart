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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddDoseView()),
        );
      },
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            color: kBtnColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.add, size: 32, color: Colors.white),
                Text(
                  'Add New Dose ',
                  style: kSubTitleStyle.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
