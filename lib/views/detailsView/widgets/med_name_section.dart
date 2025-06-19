import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';

class MedNameSection extends StatelessWidget {
  const MedNameSection({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Medicine Name',
          style: kSubTitleStyle,
        ),
        Text(
          dose.medName,
          style: kSubTitleStyle.copyWith(fontSize: 32),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}