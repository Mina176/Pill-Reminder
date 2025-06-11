import 'package:flutter/material.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/med_type_card.dart';

class MedTypeSelectSection extends StatelessWidget {
  const MedTypeSelectSection(
      {super.key,
      required this.typeIcons,
      required this.selectedindex,
      required this.onChanged});

  final List<Icon> typeIcons;
  final int selectedindex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Medication Form',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        SizedBox(
            height: 100,
            child: Row(
              children: List.generate(3, (index) {
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
