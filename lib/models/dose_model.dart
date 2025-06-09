enum Type { pill, tablet, syringe }

enum Food { beforeMeal, afterMeal, midMeal }

class DoseModel {
  final String name;
  final String time;
  final Food food;
  final Type type;

  DoseModel(
      {required this.name,
      required this.time,
      required this.food,
      required this.type});
}
