import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';
import 'details_food_card.dart';

class CustomDetailsSection extends StatelessWidget {
  const CustomDetailsSection({
    super.key,
    required this.dose,
    required this.title,
    this.displayedText,
    this.widget,
  });
  final DoseModel dose;
  final String title;
  final String? displayedText;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: kSubTitleStyle),
        widget ??
            CustomDetailsCard(
              displayedText: displayedText ?? '',
            )
      ],
    );
  }
}
