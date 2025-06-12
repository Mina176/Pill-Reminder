import 'package:flutter/material.dart';
import 'package:pill_reminder/views/addDoseVew/widgets/dose_count_item.dart';

class DoseSection extends StatelessWidget {
  const DoseSection({
    super.key,
    required this.selectedindex,
    required this.onChanged,
  });

  final int selectedindex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dose',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 60,
          child: Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: DoseCountItem(
                  count: index,
                  onPressed: () {
                    onChanged(index);
                  },
                  isSelected: selectedindex == index,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
