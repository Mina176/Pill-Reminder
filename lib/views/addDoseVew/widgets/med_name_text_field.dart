import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedNameTextField extends StatelessWidget {
  const MedNameTextField(
      {super.key,
      required this.controller,
      required this.autovalidateMode,
      required this.validator});

  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: 'Medication Name',
        border: buildBorder(color: kPrimaryColor),
        enabledBorder: buildBorder(color: kPrimaryColor),
        focusedBorder: buildBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color color = kDisabledColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
