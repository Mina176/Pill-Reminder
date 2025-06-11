import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  String formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(selectedDate);
  }

  Future pickDate() async {
    final DateTime? picked = await showDatePicker(
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
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: Row(
        children: [
          Text(
            formatDate(selectedDate),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          IconButton(
            onPressed: pickDate,
            icon: Icon(FontAwesomeIcons.solidCalendarDays),
          ),
        ],
      ),
    );
  }
}
