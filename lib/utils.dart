import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'constants.dart';

Future<void> initHiveBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TimeAdapter());
  Hive.registerAdapter(DoseModelAdapter());
  await Hive.openBox<DoseModel>(kDoseBox);
}


Future<dynamic> showDatePickerIos({
  required BuildContext context,
  required ValueChanged<DateTime> onDateChanged,
}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoModalPickerWrapper(
            picker: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              itemExtent: 35,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          ));
}

Future<dynamic> showItemPickerIos({
  required BuildContext context,
  required ValueChanged<int> onitemChanged,
  required int initialItem,
  required List listName,
}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoModalPickerWrapper(
            picker: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: initialItem,
              ),
              itemExtent: 35,
              onSelectedItemChanged: onitemChanged,
              children: listName.map((d) => Text(d)).toList(),
            ),
          ));
}

Future<dynamic> showTimePickerIos({
  required BuildContext context,
  required TimeOfDay selectedTime,
  required ValueChanged<DateTime> onTimeChanged,
}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoModalPickerWrapper(
              picker: CupertinoDatePicker(
            use24hFormat: false,
            initialDateTime: DateTime(
              0,
              0,
              0,
              selectedTime.hour,
              selectedTime.minute,
            ),
            mode: CupertinoDatePickerMode.time,
            itemExtent: 30,
            onDateTimeChanged: onTimeChanged,
          )));
}

class CupertinoModalPickerWrapper extends StatelessWidget {
  const CupertinoModalPickerWrapper({
    super.key,
    required this.picker,
  });

  final Widget picker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            height: 200,
            child: picker,
          ),
          SizedBox(height: 10),
          SizedBox(
            child: CupertinoButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Done', style: TextStyle(color: Colors.red)),
            ),
          )
        ],
      ),
    );
  }
}

IconData intFormToIconData(int val) {
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

addDoseToBox(DoseModel dose) async {
  var doseBox = Hive.box<DoseModel>(kDoseBox);
  await doseBox.add(dose);
}

deleteMed(DoseModel dose) {
  final box = Hive.box<DoseModel>(kDoseBox);
  box.delete(dose.key);
}

String formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }
 

String formatSelectedDate(DateTime? date) {
  if (date == null) {
    return DateFormat('MMM d, y').format(DateTime.now());
  }
  return DateFormat('MMM d, y').format(date);
}

String timeOfDayToString(TimeOfDay? selectedTime) {
  if (selectedTime == null) return "9:00 AM";
  final hour = selectedTime.hourOfPeriod.toString();
  final minute = selectedTime.minute.toString().padLeft(2, '0');
  final period = selectedTime.period == DayPeriod.am ? "AM" : "PM";
  return "$hour:$minute $period";
}

Time timeofDayToTimeObject(TimeOfDay timeofDay) {
  return Time(hour: timeofDay.hour, minute: timeofDay.minute);
}

String timeObjectToString(Time time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final hourStr = hour.toString().padLeft(2, '0');
  final minuteStr = time.minute.toString().padLeft(2, '0');
  final period = time.hour < 12 ? 'AM' : 'PM';
  return '$hourStr:$minuteStr $period';
}


String alarmIs(bool remind) {
    return remind ? 'on' : 'off';
  }


  
