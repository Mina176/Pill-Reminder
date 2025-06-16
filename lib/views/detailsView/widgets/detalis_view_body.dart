import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/dose_count_item.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/food_and_med_section.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_type_card.dart';
import 'package:pill_reminder/views/detailsView/widgets/selected_time.dart';

import 'selected_duration.dart';

class DetalisViewBody extends StatelessWidget {
  const DetalisViewBody({super.key, required this.dose});

  final DoseModel dose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Medicine Name',
            style: kSubTitleStyle,
          ),
          Text(
            dose.medName,
            style: kSubTitleStyle.copyWith(fontSize: 42),
            maxLines: 3,
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
          DoseCountItem(
            count: dose.dose,
            onPressed: () {},
            isSelected: true,
          ),
          Text('Food and Medicine', style: kSubTitleStyle),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: FoodCard(
              text: intFoodToString(dose.food),
              onPressed: () {},
              isSelected: true,
            ),
          ),
          Text('Duration', style: kSubTitleStyle),
          SizedBox(height: 5),
          SelectedDuration(dose: dose),
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

class CustomAnimatedBtn extends StatefulWidget {
  const CustomAnimatedBtn({
    super.key,
    required this.dose,
  });
  final DoseModel dose;
  @override
  State<CustomAnimatedBtn> createState() => _CustomAnimatedBtnState();
}

class _CustomAnimatedBtnState extends State<CustomAnimatedBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.dose.isTaken = !(widget.dose.isTaken ?? false);
          widget.dose.save();
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: widget.dose.isTaken ?? false ? Colors.green : kBtnColor,
            borderRadius: BorderRadius.circular(18)),
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        child: Center(
          child: widget.dose.isTaken ?? false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Medicine Taken ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    )
                  ],
                )
              : Text(
                  'Take Medicine',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
        ),
      ),
    );
  }
}
