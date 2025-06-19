import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/detailsView/widgets/details_buutons.dart';
import 'package:pill_reminder/views/detailsView/widgets/med_details.dart';
import 'package:pill_reminder/views/detailsView/widgets/med_name_section.dart';

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
          MedNameSection(dose: dose),
          Expanded(child: MedDetails(dose: dose)),
          DetailsButtons(dose: dose),
        ],
      ),
    );
  }
}
