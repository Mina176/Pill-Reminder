import 'package:flutter/material.dart';

import 'dose_card.dart';

class DoseCardsListView extends StatelessWidget {
  const DoseCardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return DoseCard();
      },
    ));
  }
}
