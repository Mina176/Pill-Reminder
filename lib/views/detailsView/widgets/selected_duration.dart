import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';

class SelectedDuration extends StatelessWidget {
  const SelectedDuration({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 120,
        height: 50,
        decoration: BoxDecoration(
            color: kPrimaryColor,
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
            durations[dose.duration],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
