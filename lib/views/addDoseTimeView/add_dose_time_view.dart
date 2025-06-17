import 'package:flutter/material.dart';

import 'widgets/add_dose_time_view_body.dart';

class AddDoseTimeView extends StatelessWidget {
  const AddDoseTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: AddDoseTimeViewBody()),
    );
  }
}
