import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import 'add_med_name_section.dart';
import 'add_pill_time.dart';
import 'food_and_med_section.dart';
import 'med_type_select_section.dart';

class AddDoseBody extends StatefulWidget {
  const AddDoseBody({super.key});

  @override
  State<AddDoseBody> createState() => _AddDoseBodyState();
}

class _AddDoseBodyState extends State<AddDoseBody> {
  int selectedDose = 0;
  int selectedType = 0;
  int selectedFood = 0;

  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddMedNameSection(),
        SizedBox(
          height: 20,
        ),
        MedTypeSection(
          selectedindex: selectedType,
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        MedDoseSection(
          selectedindex: selectedDose,
          onChanged: (value) {
            setState(() {
              selectedDose = value;
            });
          },
        ),
        SizedBox(
          height: 30,
        ),
        AddPillTime(onTap: showTimePicker),
        SizedBox(
          height: 10,
        ),
        FoodAndMedSection()
      ],
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
                  selectedTime?.hour ?? DateTime.now().hour,
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
