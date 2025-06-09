import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/widgets/alert_toggle.dart';

class DoseCard extends StatefulWidget {
  const DoseCard({super.key});

  @override
  State<DoseCard> createState() => _DoseCardState();
}

class _DoseCardState extends State<DoseCard> {
  bool alertOn = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xFFE5E5E6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Icon(
                FontAwesomeIcons.tablets,
                color: Color(0xFF49454F),
                size: 36,
              ),
              SizedBox(
                width: 32,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Ibrofen 50mg',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 18,
                          color: Color(0xFF8D8D8B),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '7:30 am',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8D8D8B)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              AlertToggle(
                  onPressed: () {
                    setState(() {
                      alertOn = !alertOn;
                    });
                  },
                  alertOn: alertOn)
            ],
          )),
    );
  }
}
