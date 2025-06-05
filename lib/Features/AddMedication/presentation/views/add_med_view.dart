import 'package:flutter/material.dart';

import 'widgets/add_med_body.dart';

class AddMedView extends StatelessWidget {
  const AddMedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AddMedBody()),
    );
  }
}