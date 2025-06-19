import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/models/dose_model.dart';
import '../../../utils.dart';

class DoseCard extends StatelessWidget {
  const DoseCard({
    super.key,
    required this.dose,
    required this.onTap,
    required this.alertOnPressed,
  });
  final DoseModel dose;
  final VoidCallback onTap;
  final VoidCallback alertOnPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          isTakenToIcon(dose.isTaken),
                          color: (dose.isTaken) ? Colors.green : kPrimaryColor,
                          size: 26,
                        ),
                        SizedBox(width: 18),
                        Flexible(
                          child: Text(
                            dose.medName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'dose: ${dose.dose + 1} ${intFormToString(dose.form)}',
                      style: kFeaturesStyle,
                    ),
                    Text(
                      'features: ${intFoodToString(dose.food)}',
                      style: kFeaturesStyle,
                    ),
                  ],
                ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: alertOnPressed,
                        child: Icon(
                          dose.remind
                              ? FontAwesomeIcons.solidBell
                              : FontAwesomeIcons.solidBellSlash,
                          color: kDisabledColor,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        timeObjectToString(dose.time),
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData isTakenToIcon(bool isTaken) {
    return isTaken ? FontAwesomeIcons.check : intFormToIconData(dose.form);
  }
}
