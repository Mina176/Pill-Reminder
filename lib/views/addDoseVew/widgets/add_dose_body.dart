import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/utils.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/custom_btn.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_duration_sec.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/remind_me_section.dart';
import '../../../notification_service.dart';
import 'add_med_name_section.dart';
import 'food_and_med_section.dart';
import 'med_type_select_section.dart';

class AddDoseBody extends StatefulWidget {
  const AddDoseBody({super.key});

  @override
  State<AddDoseBody> createState() => _AddDoseBodyState();
}

class _AddDoseBodyState extends State<AddDoseBody> {
  static DateTime selectedDateTime = DateTime(2025, 6, 23 , 9 , 0);


  String? medName;
  int selectedForm = 0;
  int selectedDose = 0;
  int selectedFood = 0;

  int selectedDuration = 2;

  bool remind = true;

  addMed() {
    if (textController.text.isNotEmpty) {
      medName = textController.text;
      addDoseToBox(DoseModel(
        medName: medName!,
        form: selectedForm,
        dose: selectedDose,
        food: selectedFood,
        dateTime: selectedDateTime,
        duration: selectedDuration,
        remind: remind,
        isTaken: false,
      ));
      NotificationService().scheduledReminder(
        id: 1,
        title: 'Test Notification',
        body: 'This is a test notification.',
        scheduledDateTime: selectedDateTime,
      );
      Navigator.pop(context);
    } else {
      autovalidateMode = AutovalidateMode.always;
      scrollController.jumpTo(scrollController.position.minScrollExtent);
      setState(() {});
    }
  }

  final ScrollController scrollController = ScrollController();

  late TextEditingController textController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          AddMedNameSection(
            controller: textController,
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
              setState(() => selectedDose = value);
            },
          ),
          kSectionsSpace,
          FoodAndMedSection(
            selectedindex: selectedFood,
            onChanged: (value) {
              setState(() => selectedFood = value);
            },
          ),
          /////////////////////////////Dose Time////////////////////////////////////
          kSectionsSpace,
          MedSelectionSec(
              title: 'Starting from:',
              onTap: () => pickDate(context),
              selectedText: formatSelectedDate(selectedDateTime)),
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
            onTap: () => pickTime(context),
            selectedText: DateFormat('hh:mm a').format(selectedDateTime),
          ),

          RemindMeSection(
            value: remind,
            onChanged: (value) {
              setState(() => remind = value);
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

  Future<DateTime?> pickDate(BuildContext context) {
    return showDatePickerIos(
        context: context,
        onDateChanged: (DateTime? newDate) {
          if (newDate == null) return;
          setState(() => selectedDateTime = newDate);
        });
  }

  Future<dynamic> pickTime(BuildContext context) {
    return showTimePickerIos(
        context: context,
        selectedTime: selectedDateTime,
        onTimeChanged: (DateTime newTime) {
          setState(
            () => selectedDateTime = DateTime(
              selectedDateTime.year,
              selectedDateTime.month,
              selectedDateTime.day,
              newTime.hour,
              newTime.minute,
            ),
          );
        });
  }
}
