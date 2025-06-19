import 'package:flutter/material.dart';
import 'package:pill_reminder/utils.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/custom_btn.dart';
import '../../../models/dose_model.dart';
import '../../addDoseVew/widgets/med_duration_sec.dart';
import '../../addDoseVew/widgets/remind_me_section.dart';
import '../../../constants.dart';

class AddDoseTimeViewBody extends StatefulWidget {
  const AddDoseTimeViewBody({super.key, required this.dose});
  final DoseModel dose;

  @override
  State<AddDoseTimeViewBody> createState() => _AddDoseTimeViewBodyState();
}

class _AddDoseTimeViewBodyState extends State<AddDoseTimeViewBody> {
  int selectedDuration = 2;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  bool remind = true;

  Time timeofDayToTimeObject(TimeOfDay timeofDay) {
    return Time(hour: timeofDay.hour, minute: timeofDay.minute);
  }

  addMed() {
    widget.dose.date = selectedDate;
    widget.dose.duration = selectedDuration;
    widget.dose.remind = remind;
    widget.dose.time =
        timeofDayToTimeObject(selectedTime ?? TimeOfDay(hour: 9, minute: 0));

    addDose(widget.dose);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
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
        Spacer(),
        RemindMeSection(
          value: remind,
          onChanged: (value) {
            setState(() {
              remind = value;
            });
          },
        ),
        CustomBtn(label: 'Add Medicine', onTap: () => addMed()),
        kBottomSpace
      ],
    );
  }
}
