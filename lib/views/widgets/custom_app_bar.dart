import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
            )),
        Expanded(
          child: Text(
            text,
            style: kTitleStyle.copyWith(fontSize: 30),
          ),
        )
      ],
    );
  }
}
