import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/custom_btn.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_duration_sec.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/remind_me_section.dart';
import '../../../constants.dart';
import '../../../utils.dart';
import 'add_med_name_section.dart';
import 'food_and_med_section.dart';
import 'med_type_select_section.dart';

class AddDoseBody extends StatefulWidget {
  const AddDoseBody({super.key});

  @override
  State<AddDoseBody> createState() => _AddDoseBodyState();
}

class _AddDoseBodyState extends State<AddDoseBody> {
  String? medName;
  int selectedForm = 0;
  int selectedDose = 0;
  int selectedFood = 0;

  DateTime? selectedDate;
  int selectedDuration = 2;
  TimeOfDay? selectedTime;

  bool remind = true;

  addMed() {
    if (controller.text.isNotEmpty) {
      setState(() {
        medName = controller.text;
      });
      addDoseToBox(DoseModel(
        medName: medName!,
        form: selectedForm,
        dose: selectedDose,
        food: selectedFood,
        date: selectedDate,
        duration: selectedDuration,
        time: timeofDayToTimeObject(
            selectedTime ?? TimeOfDay(hour: 9, minute: 0)),
        remind: remind,
        isTaken: false,
      ));
      Navigator.pop(context);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  late TextEditingController controller;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  nextOnTap() {}

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
    return SingleChildScrollView(
      child: Column(
        children: [
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

          kSectionsSpace,
          MedFormSection(
            selectedindex: selectedForm,
            onChanged: (value) {
              setState(() {
                selectedForm = value;
              });
            },
          ),
          kSectionsSpace,
          DoseSection(
            selectedindex: selectedDose,
            onChanged: (value) {
              setState(() {
                selectedDose = value;
              });
            },
          ),
          kSectionsSpace,
          FoodAndMedSection(
            selectedindex: selectedFood,
            onChanged: (value) {
              setState(() {
                selectedFood = value;
              });
            },
          ),
          /////////////////////////////Dose Time////////////////////////////////////
          kSectionsSpace,
          MedSelectionSec(
              title: 'Starting from:',
              onTap: () => showDatePickerIos(
                    context: context,
                    onDateChanged: (DateTime newDate) =>
                        setState(() => selectedDate = newDate),
                  ),
              selectedText: formatSelectedDate(selectedDate)),
          kSectionsSpace,
          MedSelectionSec(
            title: 'Duration:',
            onTap: () => showItemPickerIos(
              context: context,
              initialItem: selectedDuration,
              listName: durations,
              onitemChanged: (int value) {
                setState(() => selectedDuration = value);
              },
            ),
            selectedText: durations[selectedDuration],
          ),
          kSectionsSpace,
          MedSelectionSec(
            title: 'Time:',
            onTap: () => showTimePickerIos(
                context: context,
                selectedTime: selectedTime ?? TimeOfDay(hour: 9, minute: 00),
                onTimeChanged: (newTime) {
                  setState(() => selectedTime =
                      TimeOfDay(hour: newTime.hour, minute: newTime.minute));
                }),
            selectedText: timeOfDayToString(selectedTime),
          ),
          RemindMeSection(
            value: remind,
            onChanged: (value) {
              setState(() {
                remind = value;
              });
            },
          ),

          kSectionsSpace,
          kSectionsSpace,
          CustomBtn(
            onTap: () => addMed(),
            label: 'Add Medicine',
          ),
          kBottomSpace
        ],
      ),
    );
  }
}
