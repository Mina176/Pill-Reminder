import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';

class SelectedTime extends StatelessWidget {
  const SelectedTime({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          dose.time,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
