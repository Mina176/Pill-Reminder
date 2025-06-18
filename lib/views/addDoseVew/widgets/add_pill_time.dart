import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedTime extends StatelessWidget {
  const MedTime({super.key, required this.onTap, required this.displayedTime});
  final VoidCallback onTap;
  final String displayedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Time:', style: kSubTitleStyle),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: 0.06), // very subtle shadow
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  displayedTime,
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
