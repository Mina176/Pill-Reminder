import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

import 'widgets/add_dose_time_view_body.dart';

class AddDoseTimeView extends StatelessWidget {
  const AddDoseTimeView({super.key, required this.dose});
  final DoseModel dose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: AddDoseTimeViewBody(
        dose: dose,
      )),
    );
  }
}
