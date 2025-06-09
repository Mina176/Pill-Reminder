import 'package:flutter/material.dart';

import 'package:pill_reminder/widgets/custom_date_picker.dart';

import 'dose_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDatePicker(),
        Expanded(
            child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return DoseCard();
          },
        ))
      ],
    );
  }
}
