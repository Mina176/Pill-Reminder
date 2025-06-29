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
  bool remind;
  @HiveField(6)
  bool isTaken;
  @HiveField(7)
  final DateTime? dateTime;

  DoseModel(
      {required this.isTaken,
      required this.remind,
      required this.medName,
      required this.form,
      required this.dose,
      required this.food,
      required this.duration,
      required this.dateTime});
}
