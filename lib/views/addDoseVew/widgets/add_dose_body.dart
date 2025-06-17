import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseTimeView/add_dose_time_view.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import 'add_med_name_section.dart';
import 'custom_next_btn.dart';
import 'food_and_med_section.dart';
import 'med_type_select_section.dart';

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

  nextOnTap() {
    if (controller.text.isNotEmpty) {
      setState(() {
        medName = controller.text;
      });
      DoseModel dose = DoseModel(
        medName: medName!,
        form: selectedForm,
        dose: selectedDose,
        food: selectedFood,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddDoseTimeView(
            dose: dose,
          ),
        ),
      );

    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

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
        Spacer(),
        NextCustomBtn(
          onTap: () => nextOnTap(),
        )
      ],
    );
  }
}
