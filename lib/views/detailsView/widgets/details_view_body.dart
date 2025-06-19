import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/custom_btn.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/dose_count_item.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/food_and_med_section.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_type_card.dart';
import 'package:pill_reminder/views/detailsView/widgets/selected_time.dart';
import '../../../utils.dart';
import 'custom_animated_btn.dart';
import 'selected_duration.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.dose});

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MedNameSection(dose: dose),
          Flexible(child: MedDetails(dose: dose)),
          Buttons(dose: dose),
        ],
      ),
    );
  }
}

class MedDetails extends StatelessWidget {
  const MedDetails({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Med Form', style: kSubTitleStyle),
        MedTypeCard(
          icon: formToIcon(
            dose.form,
          ),
          cardColor: kPrimaryColor,
          formInt: dose.form,
          isSelected: true,
        ),
        Text('Dose', style: kSubTitleStyle),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: DoseCountItem(
            count: dose.dose,
            isSelected: true,
          ),
        ),
        Text('Food and Medicine', style: kSubTitleStyle),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: FoodCard(
            text: intFoodToString(dose.food),
            isSelected: true,
          ),
        ),
        Text('Duration', style: kSubTitleStyle),
        SizedBox(height: 5),
        SelectedDuration(dose: dose),
        SizedBox(height: 5),
        Text('Time', style: kSubTitleStyle),
        SizedBox(height: 5),
        SelectedTime(dose: dose),
        SizedBox(height: 10),
        Text('Remind me is ${dose.remind ? 'on' : 'off'}',
            style: kSubTitleStyle),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

class MedNameSection extends StatelessWidget {
  const MedNameSection({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medicine Name',
          style: kSubTitleStyle,
        ),
        Text(
          dose.medName,
          style: kSubTitleStyle.copyWith(fontSize: 32),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.dose,
  });

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomBtn(
              color: Colors.red,
              onTap: () {
                deleteMed();
                Navigator.of(context).pop();
              },
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Delete',
                    style: kBtnTextStyle,
                  ),
                  Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomAnimatedBtn(
              dose: dose,
            ),
          ),
        ],
      ),
    );
  }

  deleteMed() {
    final box = Hive.box<DoseModel>(kDoseBox);
    box.delete(dose.key);
  }
}
