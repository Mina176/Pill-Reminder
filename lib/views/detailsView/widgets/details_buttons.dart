import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/utils.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/custom_btn.dart';

import '../../../constants.dart';
import 'custom_animated_btn.dart';

class DetailsButtons extends StatelessWidget {
  const DetailsButtons({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomBtn(
              color: Colors.red,
              onTap: () {
                deleteMed(dose);
                Navigator.of(context).pop();
              },
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Delete',
                    style: kBtnTextStyle,
                  ),
                  Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomAnimatedBtn(
              dose: dose,
            ),
          ),
        ],
      ),
    );
  }
}
