import 'package:flutter/material.dart';
import 'package:pill_reminder/widgets/custom_date_picker.dart';
import 'Dose_cards_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomDatePicker(), DoseCardsListView()],
    );
  }
}

