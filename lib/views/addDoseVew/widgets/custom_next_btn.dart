import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'custom_btn.dart';

class NextCustomBtn extends StatelessWidget {
  const NextCustomBtn({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomBtn(
          width: MediaQuery.of(context).size.width / 4,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          onTap: onTap,
        )
      ],
    );
  }
}
