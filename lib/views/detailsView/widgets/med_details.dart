import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/views/detailsView/widgets/custom_details_section.dart';
import '../../../models/dose_model.dart';
import '../../../utils.dart';

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
          displayedText: timeObjectToString(dose.time!),
        ),
      ],
    );
  }
}

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
