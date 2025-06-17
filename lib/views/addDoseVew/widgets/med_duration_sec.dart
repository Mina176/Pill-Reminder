import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedDurationSec extends StatelessWidget {
  const MedDurationSec({
    super.key,
    required this.onTap,
    required this.displayedDuration,
    required this.title,
  });
  final String title;
  final VoidCallback onTap;
  final String displayedDuration;
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
              border: Border.all(color: kDisabledColor, width: 0.1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: 0.06), // very subtle shadow
                  blurRadius: 8,
                  offset: Offset(0, 8.5),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  displayedDuration,
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
