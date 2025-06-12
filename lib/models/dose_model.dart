class DoseModel {
  final String medName;
  final int type;
  final int dose;
  final int food;
  final int duration;
  final String time;
  final bool remind;

  DoseModel({
    required this.remind,
    required this.medName,
    required this.type,
    required this.dose,
    required this.food,
    required this.duration,
    required this.time,
  });
}
