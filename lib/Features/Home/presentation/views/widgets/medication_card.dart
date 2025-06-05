import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(
              alpha: 180, // Adjust the alpha value for shadow intensity
            ),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Image.asset(
            'assets/images/medical.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ibrofen 50mg',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Take 1 pill every 6 hours',
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bowlFood,
                    size: 16,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Icon(
                    FontAwesomeIcons.circleDot,
                    size: 12,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
