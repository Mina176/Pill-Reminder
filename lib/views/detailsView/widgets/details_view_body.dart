import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/detailsView/widgets/details_buttons.dart';
import 'package:pill_reminder/views/detailsView/widgets/med_details.dart';

import '../../../constants.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.dose});

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MedDetails(dose: dose),
          Spacer(),
          DetailsButtons(dose: dose),
          kBottomSpace
        ],
      ),
    );
  }
}
