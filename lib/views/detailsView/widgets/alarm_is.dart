import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';
import '../../../utils.dart';

class AlarmIs extends StatelessWidget {
  const AlarmIs({
    super.key,
    required this.dose,
  });
  final DoseModel dose;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            dose.remind
                ? Icon(
                    FontAwesomeIcons.solidBell,
                    color: kPrimaryColor,
                  )
                : Icon(
                    FontAwesomeIcons.solidBellSlash,
                    color: kPrimaryColor,
                  ),
            Text(
              'Alarm is ${alarmIs(dose.remind)}',
              style: kSubTitleStyle.copyWith(
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
