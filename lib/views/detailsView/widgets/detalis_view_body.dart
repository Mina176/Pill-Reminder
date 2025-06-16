import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

class DetalisViewBody extends StatelessWidget {
  const DetalisViewBody({super.key, required this.dose});

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Text(dose.medName);
  }
}
