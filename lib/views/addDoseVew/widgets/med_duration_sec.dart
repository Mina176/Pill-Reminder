import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedSelectionSec extends StatelessWidget {
  const MedSelectionSec({
    super.key,
    required this.onTap,
    required this.selectedText,
    required this.title,
  });
  final String title;
  final VoidCallback onTap;
  final String selectedText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(title, style: kSubTitleStyle),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  selectedText,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
