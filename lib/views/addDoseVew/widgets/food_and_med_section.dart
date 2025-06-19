import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

import 'food_card.dart';

class FoodAndMedSection extends StatelessWidget {
  const FoodAndMedSection({
    super.key,
    required this.selectedindex,
    required this.onChanged,
  });
  final int selectedindex;
  final ValueChanged<int> onChanged;

  final List<String> foodAndMed = const [
    'Before Meal',
    'With Meal',
    'After Meal'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Food and Medication:', style: kSubTitleStyle),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Expanded(
              child: FoodCard(
                  text: foodAndMed[index],
                  isSelected: selectedindex == index,
                  onPressed: () => onChanged(index)),
            );
          }),
        )
      ],
    );
  }
}
