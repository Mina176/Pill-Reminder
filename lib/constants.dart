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

const kDoseBox = 'doseBox';

const TextStyle kPopUpMenuStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

IconData formToIcon(int val) {
  if (val == 0) {
    return FontAwesomeIcons.tablets;
  } else if (val == 1) {
    return FontAwesomeIcons.pills;
  } else {
    return FontAwesomeIcons.syringe;
  }
}

String intFormToString(int val) {
  if (val == 0) {
    return 'tablets';
  } else if (val == 1) {
    return 'pills';
  } else {
    return 'syringe';
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

fetchAllDoses() {
  List<DoseModel>? alldoses;
  var dosesBox = Hive.box<DoseModel>(kDoseBox);
  alldoses = dosesBox.values.toList();
  print(alldoses);
}
