import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedNameTextField extends StatelessWidget {
  const MedNameTextField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
      },
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
