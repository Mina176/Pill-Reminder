import 'package:flutter/material.dart';
import '../../../constants.dart';

class MedTypeCard extends StatelessWidget {
  const MedTypeCard(
      {super.key,
      required this.type,
      required this.onPressed,
      required this.isSelected});
  final Icon type;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected == true ? kPrimaryColor : kDisabledColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(child: type),
        ),
      ),
    );
  }
}
