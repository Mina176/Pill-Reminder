import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_dose_select_section.dart';
import 'add_med_name_section.dart';
import 'med_type_select_section.dart';

class AddDoseBody extends StatefulWidget {
  const AddDoseBody({super.key});

  @override
  State<AddDoseBody> createState() => _AddDoseBodyState();
}

class _AddDoseBodyState extends State<AddDoseBody> {
  int selectedDose = 0;
  int selectedType = 0;

  final List<Icon> typeIcons = const [
    Icon(FontAwesomeIcons.tablets, size: 50),
    Icon(FontAwesomeIcons.capsules, size: 50),
    Icon(FontAwesomeIcons.syringe, size: 50),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AddMedNameSection(),
          SizedBox(
            height: 20,
          ),
          MedTypeSelectSection(
            typeIcons: typeIcons,
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
          MedDoseSelectSection(
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
          AddPillTime(
            onTap: () {
              CupertinoTimerPicker(onTimerDurationChanged: onTimerDurationChanged)
            },
          ),
        ],
      ),
    );
  }
}

class AddPillTime extends StatelessWidget {
  const AddPillTime({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.access_time_outlined,
            color: kPrimaryColor,
            size: 28,
          ),
          Text(
            'Add Medicine Time',
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
