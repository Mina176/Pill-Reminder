
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.clock,
            size: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '7:30 am',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
