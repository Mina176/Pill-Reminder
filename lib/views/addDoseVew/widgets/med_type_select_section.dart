import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/constants.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_type_card.dart';

class MedFormSection extends StatelessWidget {
  const MedFormSection(
      {super.key, required this.selectedindex, required this.onChanged});

  final int selectedindex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final List<IconData> typeIcons = const [
      FontAwesomeIcons.tablets,
      FontAwesomeIcons.capsules,
      FontAwesomeIcons.syringe,
      FontAwesomeIcons.flask,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Medication Form:',
            style: kSubTitleStyle,
          ),
        ),
        SizedBox(
            height: 100,
            child: Row(
              children: List.generate(typeIcons.length, (index) {
                return Expanded(
                    child: TypeCard(
                  formInt: index,
                  cardColor:
                      selectedindex == index ? kPrimaryColor : Colors.white,
                  icon: typeIcons[index],
                  onPressed: () {
                    onChanged(index);
                  },
                  isSelected: selectedindex == index,
                ));
              }),
            )),
      ],
    );
  }
}
