import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

import 'widgets/add_dose_body.dart';

class AddDoseView extends StatelessWidget {
  const AddDoseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Medicine', style: kTitleStyle),
        leading: BackButton(),
        forceMaterialTransparency: true,
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

