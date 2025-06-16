import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

import 'widgets/detalis_view_body.dart';

class DetalisView extends StatelessWidget {
  const DetalisView({super.key,required this.dose});
  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetalisViewBody(dose: dose,),
      ),
    );
  }
}
