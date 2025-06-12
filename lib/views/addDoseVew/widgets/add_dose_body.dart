import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import '../../../constants.dart';
import 'add_med_name_section.dart';
import 'add_pill_btn.dart';
import 'add_pill_time.dart';
import 'food_and_med_section.dart';
import 'med_duration_sec.dart';
import 'med_type_select_section.dart';
import 'remind_me_section.dart';

class AddDoseBody extends StatefulWidget {
  const AddDoseBody({super.key});

  @override
  State<AddDoseBody> createState() => _AddDoseBodyState();
}

class _AddDoseBodyState extends State<AddDoseBody> {
  String? medName;
  int selectedDose = 0;
  int selectedType = 0;
  int selectedFood = 0;

  bool? remind = true;

  TimeOfDay? selectedTime;

  int selectedDuration = 2;

  final List<String> durations = [
    '30 days',
    '45 days',
    '60 days',
    '75 days',
    '90 days',
  ];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text('Add Medication', style: kTitleStyle),
          AddMedNameSection(
            onSaved: (value) {
              medName = value;
            },
          ),
          MedFormSection(
            selectedindex: selectedType,
            onChanged: (value) {
              setState(() {
                selectedType = value;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          DoseSection(
            selectedindex: selectedDose,
            onChanged: (value) {
              setState(() {
                selectedDose = value;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          FoodAndMedSection(
            selectedindex: selectedFood,
            onChanged: (value) {
              setState(() {
                selectedFood = value;
              });
            },
          ),
          MedDurationSec(
            onTap: showDurationPicker,
            displayedDuration: durations[selectedDuration],
          ),
          MedTime(
            onTap: showTimePicker,
            displayedTime: formattedTime,
          ),
          SizedBox(
            height: 10,
          ),
          RemindMeSection(
            value: remind!,
            onChanged: (value) {
              setState(() {
                remind = value;
              });
            },
          ),
          Spacer(),
          CustomBtn(
            label: 'Add Medicine',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  void showDurationPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              height: 200,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: selectedDuration,
                ),
                itemExtent: 30,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    selectedDuration = value;
                  });
                },
                children: durations.map((d) => Text(d)).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: CupertinoButton(
                color: Colors.white,
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              height: 200,
              child: CupertinoDatePicker(
                use24hFormat: false,
                initialDateTime: DateTime(
                  0,
                  0,
                  0,
                  selectedTime?.hour ?? 9,
                  selectedTime?.minute ?? 00,
                ),
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (newTime) {
                  setState(() {
                    selectedTime =
                        TimeOfDay(hour: newTime.hour, minute: newTime.minute);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: CupertinoButton(
                color: Colors.white,
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          ],
        ),
      ),
    );
  }

  String get formattedTime {
    if (selectedTime == null) return "9:00 AM";
    final hour = selectedTime!.hourOfPeriod.toString();
    final minute = selectedTime!.minute.toString().padLeft(2, '0');
    final period = selectedTime!.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }
}
