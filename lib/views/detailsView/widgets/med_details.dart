import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/views/detailsView/widgets/custom_details_section.dart';
import '../../../models/dose_model.dart';
import '../../../utils.dart';
import 'alarm_is.dart';
import 'custom_med_name.dart';
import 'selected_type_card.dart';

class MedDetails extends StatelessWidget {
  const MedDetails({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDetailsSection(
          dose: dose,
          title: 'Medicine Name',
          widget: CustomMedName(dose: dose),
        ),
        CustomDetailsSection(
            dose: dose,
            title: 'Med Form',
            widget: SelectedTypeCard(
              dose: dose,
            )),
        CustomDetailsSection(
            dose: dose,
            title: 'Dose',
            displayedText: (dose.dose + 1).toString()),
        CustomDetailsSection(
            dose: dose,
            title: 'Food',
            displayedText: intFoodToString(dose.food)),
        CustomDetailsSection(
          dose: dose,
          title: 'Duration',
          displayedText: durations[dose.duration],
        ),
        CustomDetailsSection(
          dose: dose,
          title: 'Time',
          displayedText: dateTimeTohourAndMinutes(dose.dateTime),
        ),
        AlarmIs(
          dose: dose,
        ),
      ],
    );
  }

  
}
