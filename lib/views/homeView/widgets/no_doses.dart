import 'package:flutter/material.dart';

import '../../../constants.dart';

class NoDoses extends StatelessWidget {
  const NoDoses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No Doses here",
            style: kTitleStyle,
          ),
          Text(
            'Click on \'Add New Dose\'',
            style: kTitleStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
