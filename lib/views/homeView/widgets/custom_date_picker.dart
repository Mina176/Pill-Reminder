import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../utils.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker(
      {super.key, required this.onIconPressed, this.selectedDate});

  final VoidCallback onIconPressed;
  final DateTime? selectedDate;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
      child: Row(
        children: [
          Text(
            formatDate(selectedDate ?? DateTime.now()),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          IconButton(
            onPressed: onIconPressed,
            icon: Icon(FontAwesomeIcons.solidCalendarDays),
          ),
        ],
      ),
    );
  }
}
