import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

import 'widgets/details_view_body.dart';

class DetalisView extends StatelessWidget {
  const DetalisView({super.key, required this.dose});
  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: DetailsViewBody(
          dose: dose,
        ),
      ),
    );
  }
}
