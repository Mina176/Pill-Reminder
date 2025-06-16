import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/dose_count_item.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/food_and_med_section.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_type_card.dart';
import 'package:pill_reminder/views/detailsView/widgets/selected_time.dart';
import 'custom_animated_btn.dart';
import 'selected_duration.dart';

class DetalisViewBody extends StatelessWidget {
  const DetalisViewBody({super.key, required this.dose});

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Medicine Name',
            style: kSubTitleStyle,
          ),
          Text(
            dose.medName,
            style: kSubTitleStyle.copyWith(fontSize: 36),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text('Med Form', style: kSubTitleStyle),
          SizedBox(height: 5),
          MedTypeCard(
            icon: formToIcon(
              dose.form,
            ),
            cardColor: kPrimaryColor,
            formInt: dose.form,
            isSelected: true,
          ),
          Text('Dose', style: kSubTitleStyle),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
            child: DoseCountItem(
              count: dose.dose,
              isSelected: true,
            ),
          ),
          Text('Food and Medicine', style: kSubTitleStyle),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
            child: FoodCard(
              text: intFoodToString(dose.food),
              onPressed: () {},
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
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CustomAnimatedBtn(dose: dose)],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
