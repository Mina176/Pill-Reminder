import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

import 'dose_card.dart';

class DoseCardsListView extends StatefulWidget {
  const DoseCardsListView({
    super.key,
  });

  @override
  State<DoseCardsListView> createState() => _DoseCardsListViewState();
}

class _DoseCardsListViewState extends State<DoseCardsListView> {
  List<DoseModel> doses = [
    DoseModel(
      remind: false,
      medName: 'Mina',
      form: 0,
      dose: 0,
      food: 0,
      duration: 0,
      time: '6:00 Am',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: doses.length,
          itemBuilder: (context, index) {
            return DoseCard(
              doseModel: doses[index],
            );
          }),
    ));
  }
}
