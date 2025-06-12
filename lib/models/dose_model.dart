import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'dose_model.g.dart';

@HiveType(typeId: 0)
class DoseModel extends HiveObject {
  @HiveField(0)
  final String medName;
  @HiveField(1)
  final int form;
  @HiveField(2)
  final int dose;
  @HiveField(3)
  final int food;
  @HiveField(4)
  final int duration;
  @HiveField(5)
  final String time;
  @HiveField(6)
  final bool remind;

  DoseModel({
    required this.remind,
    required this.medName,
    required this.form,
    required this.dose,
    required this.food,
    required this.duration,
    required this.time,
  });

 static IconData formToIcon(int val) {
    if (val == 0) {
      return FontAwesomeIcons.tablets;
    } else if (val == 1) {
      return FontAwesomeIcons.pills;
    } else {
      return FontAwesomeIcons.syringe;
    }
  }
}
