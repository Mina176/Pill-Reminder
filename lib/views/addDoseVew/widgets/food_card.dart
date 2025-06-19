import 'package:flutter/material.dart';

import '../../../constants.dart';

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
          height: 70,
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
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
