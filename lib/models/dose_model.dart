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
  int duration;
  @HiveField(5)
  String time;
  @HiveField(6)
  bool remind;
  @HiveField(7)
  bool isTaken;
  @HiveField(8)
  DateTime? date;

  DoseModel(
      {this.isTaken = false,
      this.remind = true,
      this.medName = '',
      this.form = 0,
      this.dose = 0,
      this.food = 0,
      this.duration = 2,
      this.time = '9:00',
      this.date});
}
