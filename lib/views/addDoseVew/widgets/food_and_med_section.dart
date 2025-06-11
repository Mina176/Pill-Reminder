import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

class FoodAndMedSection extends StatelessWidget {
  const FoodAndMedSection({super.key});
  final List<String> foodAndMed = const [
    'Before Meal',
    'With Meal',
    'After Meal'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Food and Medication',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return FoodCard(
              text: foodAndMed[index],
            );
          }),
        )
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            spreadRadius: 1,
          )
        ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
