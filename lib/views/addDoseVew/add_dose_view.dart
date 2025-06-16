import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/add_dose_body.dart';

class AddDoseView extends StatelessWidget {
  const AddDoseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Medication', style: kTitleStyle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AddDoseBody(),
        ),
      ),
    );
  }
}
