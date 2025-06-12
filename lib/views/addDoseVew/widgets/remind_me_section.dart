import 'package:flutter/material.dart';

class RemindMeSection extends StatelessWidget {
  const RemindMeSection(
      {super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: (val) {
            onChanged(val!);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(
            color: Colors.blue, // match your design
            width: 2,
          ),
          activeColor: Colors.blue, // checked color
        ),
        Text(
          'remind me to take medication',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
