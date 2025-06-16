import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'med_name_text_field.dart';

class AddMedNameSection extends StatelessWidget {
  const AddMedNameSection({
    super.key,
    required this.controller,
    required this.autovalidateMode,
    required this.validator,
  });
  final TextEditingController controller;
  final String? Function(String?) validator;
  final AutovalidateMode autovalidateMode;
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
        SizedBox(
          height: 70,
          child: MedNameTextField(
            controller: controller,
            validator: validator,
            autovalidateMode: autovalidateMode,
          ),
        ),
      ],
    );
  }
}
