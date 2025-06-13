import 'package:flutter/material.dart';
import 'package:pill_reminder/models/dose_model.dart';

import 'dose_card.dart';

class DoseCardsListView extends StatelessWidget {
  const DoseCardsListView(
      {super.key,
      required this.alldoses,
      required this.controller,
      });

  final List<DoseModel>? alldoses;
  final ScrollController? controller;


  @override
  Widget build(BuildContext context) {
    return alldoses == null
        ? Center(child: Text('No Doses yet!'))
        : Expanded(
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                controller: controller,
                reverse: true,
                itemCount: alldoses!.length,
                itemBuilder: (context, index) {
                  return DoseCard(
                    doseModel: alldoses![index], 
                    
                  );
                }),
          ));
  }
}
