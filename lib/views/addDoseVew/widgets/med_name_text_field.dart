import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedNameTextField extends StatelessWidget {
  const MedNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
