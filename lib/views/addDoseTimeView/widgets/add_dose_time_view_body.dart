import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/custom_btn.dart';
import '../../../models/dose_model.dart';
import '../../addDoseVew/widgets/add_pill_time.dart';
import '../../addDoseVew/widgets/med_duration_sec.dart';
import '../../addDoseVew/widgets/remind_me_section.dart';
import '../../../constants.dart';
import '../../widgets/custom_app_bar.dart';

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

  addMed() {
    widget.dose.dateTime = selectedDate;
    widget.dose.duration = selectedDuration;
    widget.dose.remind = remind;
    widget.dose.time = formatTime(selectedTime);

    addDose(widget.dose);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void showDatePicker() {
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
                mode: CupertinoDatePickerMode.date,
                itemExtent: 35,
                minimumDate: DateTime.now(),
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MedDurationSec(
            title: 'Starting from:',
            onTap: showDatePicker,
            displayedDuration: formatSelectedDate(selectedDate)),
        SizedBox(
          height: 20,
        ),
        MedDurationSec(
          title: 'Duration:',
          onTap: showDurationPicker,
          displayedDuration: durations[selectedDuration],
        ),
        SizedBox(
          height: 20,
        ),
        MedTime(
          onTap: showTimePicker,
          displayedTime: formatTime(selectedTime),
        ),
        SizedBox(
          height: 20,
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
        CustomBtn(label: 'Add Medicine', onTap: () => addMed()),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
