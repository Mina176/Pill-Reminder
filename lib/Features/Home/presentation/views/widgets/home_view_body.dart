import 'package:flutter/material.dart';
import 'package:pill_reminder/Features/Home/presentation/views/widgets/custom_app_bar.dart';

import 'meds_scroll_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBar(),
      SizedBox(height: 20),
      Expanded(child: MedsScrollView()),
    ]);
  }
}
