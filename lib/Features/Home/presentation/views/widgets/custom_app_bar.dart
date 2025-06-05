import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DatePickerRow(),
        Spacer(),
        CircleAvatar(
          radius: 20,
        ),
      ],
    );
  }
}

class DatePickerRow extends StatefulWidget {
  const DatePickerRow({super.key});

  @override
  DatePickerRowState createState() => DatePickerRowState();
}

class DatePickerRowState extends State<DatePickerRow> {
  DateTime selectedDate = DateTime.now();

  String get formattedDate =>
      DateFormat('MMM d, yyyy').format(selectedDate); // e.g., "Jun 5"

  Future<void> pickDate() async {
    final DateTime?  picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          formattedDate,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.solidCalendarDays,
              color: Colors.grey[400], size: 20),
          onPressed: pickDate,
        ),
      ],
    );
  }
}
