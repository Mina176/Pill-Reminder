import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import '../../../constants.dart';
import 'add_med_name_section.dart';
import 'custom_btn.dart';
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
  int selectedForm = 0;
  int selectedFood = 0;

  bool remind = true;

  TimeOfDay? selectedTime;

  int selectedDuration = 2;

  late TextEditingController controller;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        AddMedNameSection(
          controller: controller,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Field is required';
            } else {
              return null;
            }
          },
          autovalidateMode: autovalidateMode,
        ),
        MedFormSection(
          selectedindex: selectedForm,
          onChanged: (value) {
            setState(() {
              selectedForm = value;
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
          displayedTime: formatTime(selectedTime),
        ),
        SizedBox(
          height: 10,
        ),
        RemindMeSection(
          value: remind,
          onChanged: (value) {
            setState(() {
              remind = value;
            });
          },
        ),
        Spacer(),
        CustomBtn(
          widget: Text(
            'Add Medicine',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          onTap: () {
            if (controller.text.isNotEmpty) {
              setState(() {
                medName = controller.text;
              });
              addDose(
                DoseModel(
                  remind: remind,
                  medName: medName!,
                  form: selectedForm,
                  dose: selectedDose,
                  food: selectedFood,
                  duration: selectedDuration,
                  time: formatTime(selectedTime),
                  isTaken: false,
                ),
              );
              fetchAllDoses();
              Navigator.of(context).pop();
              controller.clear();
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
        ),
      ],
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
                itemExtent: 35,
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
                  selectedTime?.hour ?? DateTime.now().hour,
                  selectedTime?.minute ?? DateTime.now().minute,
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
}
