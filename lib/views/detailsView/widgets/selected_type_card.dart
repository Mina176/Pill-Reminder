import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';
import '../../../utils.dart';

class SelectedTypeCard extends StatelessWidget {
  const SelectedTypeCard({super.key, required this.dose});
  final DoseModel dose;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06), // very subtle shadow
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          Icon(intFormToIconData(dose.form), size: 32, color: Colors.white),
          SizedBox(
            height: 5,
          ),
          Text(
            intFormToString(
              dose.form,
            ),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
