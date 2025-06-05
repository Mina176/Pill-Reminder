import 'package:flutter/material.dart';

enum Type {
  tablet,
  capsule,
}

class Medication {
  final String name;
  final int dose;
  final TimeOfDay time;
  final Type type;

  Medication({
    required this.name,
    required this.dose,
    required this.time,
    required this.type,
  });
}

// Example usage:
final pill = Medication(
  name: "Lexapro",
  dose: 1,
  time: const TimeOfDay(hour: 21, minute: 30), // 9:30 pm
  type: Type.capsule,
);