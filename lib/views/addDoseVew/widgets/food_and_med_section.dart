import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

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

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.text,
    this.onPressed,
    required this.isSelected,
  });
  final String text;
  final VoidCallback? onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  spreadRadius: 1,
                )
              ]),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
