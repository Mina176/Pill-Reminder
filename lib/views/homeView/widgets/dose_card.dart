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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        doseModel.form == DoseModel.
                            ? FontAwesomeIcons.tablets
                            : doseModel.form == DoseModel.formPill
                                ? FontAwesomeIcons.pills
                                : FontAwesomeIcons.syringe,
                        color: kPrimaryColor,
                        size: 26,
                      ),
                      SizedBox(width: 16),
                      Text(
                        doseModel.medName,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Dose: ${doseModel.dose} ${DoseModel.formToString(doseModel.form)}',
                    style: kFeaturesStyle,
                  ),
                  Text(
                    'Featuers: $food',
                    style: kFeaturesStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.more_vert,
                        size: 32, color: Colors.black.withAlpha(140)),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    time,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
 


// Padding(
      // padding: const EdgeInsets.all(8.0),
      // child: 