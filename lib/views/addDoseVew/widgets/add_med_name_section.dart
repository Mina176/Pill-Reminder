import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'med_name_text_field.dart';

class AddMedNameSection extends StatelessWidget {
  const AddMedNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Medication Name:',
            style: kSubTitleStyle,
          ),
        ),
        MedNameTextField(),
      ],
    );
  }
}
