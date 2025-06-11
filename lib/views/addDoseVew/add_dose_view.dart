import 'package:flutter/material.dart';

import 'widgets/add_dose_body.dart';

class AddDoseView extends StatelessWidget {
  const AddDoseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AddDoseBody(),
      ),
    );
  }
}
