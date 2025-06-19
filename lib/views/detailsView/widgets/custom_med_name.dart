import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../models/dose_model.dart';

class CustomMedName extends StatelessWidget {
  const CustomMedName({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      dose.medName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
