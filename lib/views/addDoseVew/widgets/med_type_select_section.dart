import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_type_card.dart';

class MedTypeSection extends StatelessWidget {
  const MedTypeSection(
      {super.key, required this.selectedindex, required this.onChanged});

  final int selectedindex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final List<Icon> typeIcons = const [
      Icon(FontAwesomeIcons.tablets, size: 50),
      Icon(FontAwesomeIcons.capsules, size: 50),
      Icon(FontAwesomeIcons.syringe, size: 50),
    ];
    return Column(
      children: [
        Text(
          'Medication Form',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        SizedBox(
            height: 100,
            child: Row(
              children: List.generate(typeIcons.length, (index) {
                return Expanded(
                    child: MedTypeCard(
                  type: typeIcons[index],
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
