import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

class FoodAndMedSection extends StatelessWidget {
  const FoodAndMedSection(
      {super.key, required this.selectedindex, required this.onChanged});
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
            return FoodCard(
              text: foodAndMed[index],
              isSelected: selectedindex == index,
              onPressed: () {
                onChanged(index);
              },
            );
          }),
        )
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed});
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 100,
          height: 100,
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
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
