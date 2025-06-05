import 'package:flutter/material.dart';

import 'medication_card.dart';

class MedsScrollView extends StatelessWidget {
  const MedsScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return MedicationCard();
        });
  }
}

