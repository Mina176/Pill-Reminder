import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/models/dose_model.dart';

class DoseCard extends StatelessWidget {
  const DoseCard({
    super.key,
    required this.doseModel,
  });
  final DoseModel doseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06), // very subtle shadow
            blurRadius: 8,
            offset: Offset(0, 8.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      isTakenToIcon(doseModel.isTaken ?? false),
                      color: kPrimaryColor,
                      size: 26,
                    ),
                    SizedBox(width: 18),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      doseModel.medName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'dose: ${doseModel.dose + 1} ${intFormToString(doseModel.form)}',
                  style: kFeaturesStyle,
                ),
                Text(
                  'food:  ${intFoodToString(doseModel.food)}',
                  style: kFeaturesStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: kDisabledColor,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  doseModel.time,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData isTakenToIcon(bool isTaken) {
    return isTaken ? FontAwesomeIcons.check : formToIcon(doseModel.form);
  }
}
