import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'med_name_text_field.dart';

class AddMedNameSection extends StatelessWidget {
  const AddMedNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Add Medication',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 36, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 10,
        ),
        MedNameTextField(),
      ],
    );
  }
}
