import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../addDoseTimeView/add_dose_time_view.dart';
import 'custom_btn.dart';

class NextCustomBtn extends StatelessWidget {
  const NextCustomBtn({
    super.key,
    required this.context,
  });
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomBtn(
          width: MediaQuery.of(context).size.width / 4,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Next',
                style: kBtnTextStyle,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              )
            ],
          ),
          onTap: () => nextView(context),
        ),
      ],
    );
  }

  void nextView(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddDoseTimeView()));
  }
}
