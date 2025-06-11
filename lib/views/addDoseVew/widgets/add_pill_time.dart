

import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddPillTime extends StatelessWidget {
  const AddPillTime({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.access_time_outlined,
            color: kPrimaryColor,
            size: 28,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Add Medicine Time',
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
