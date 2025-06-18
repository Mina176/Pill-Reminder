import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

import '../widgets/custom_app_bar.dart';
import 'widgets/add_dose_time_view_body.dart';

class AddDoseTimeView extends StatelessWidget {
  const AddDoseTimeView({super.key, required this.dose});
  final DoseModel dose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            text: 'Medicine Duration and time',
          ),
          SizedBox(height: 10),
          Expanded(
            child: AddDoseTimeViewBody(
              dose: dose,
            ),
          ),
        ],
      )),
    );
  }
}
