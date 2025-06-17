import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/dose_model.dart';

const kDisabledColor = Color.fromARGB(255, 143, 143, 143);

const kPrimaryColor = Color(0xFF81ACFF);

const kBtnColor = Color(0xFF3C7EFF);

const kTitleStyle =
    TextStyle(color: kPrimaryColor, fontSize: 36, fontWeight: FontWeight.w900);

const kSubTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

const kFeaturesStyle = TextStyle(
    color: Color(0xFF999999), fontSize: 16, fontWeight: FontWeight.w400);

const kBtnTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.2,
);

const kDoseBox = 'doseBox';

const String kHomeView = 'Home view';
const String kAddDoseView = 'Add dose view';
const String kDetailsView = 'Details view';

const TextStyle kPopUpMenuStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

IconData formToIcon(int val) {
  if (val == 0) {
    return FontAwesomeIcons.tablets;
  } else if (val == 1) {
    return FontAwesomeIcons.pills;
  } else if (val == 2) {
    return FontAwesomeIcons.syringe;
  } else {
    return FontAwesomeIcons.flask;
  }
}

String intFormToString(int val) {
  if (val == 0) {
    return 'tablets';
  } else if (val == 1) {
    return 'pills';
  } else if (val == 2) {
    return 'syringe';
  } else {
    return 'solution';
  }
}

String intFoodToString(int val) {
  if (val == 0) {
    return 'before Meal';
  } else if (val == 1) {
    return 'In Meal';
  } else {
    return 'After Meal';
  }
}

addDose(DoseModel dose) async {
  var doseBox = Hive.box<DoseModel>(kDoseBox);
  await doseBox.add(dose);
}



String formatTime(TimeOfDay? selectedTime) {
  if (selectedTime == null) return "9:00 AM";
  final hour = selectedTime.hourOfPeriod.toString();
  final minute = selectedTime.minute.toString().padLeft(2, '0');
  final period = selectedTime.period == DayPeriod.am ? "AM" : "PM";
  return "$hour:$minute $period";
}

final List<String> durations = [
  '30 days',
  '45 days',
  '60 days',
  '75 days',
  '90 days',
  '105 days',
  '120 days',
];
