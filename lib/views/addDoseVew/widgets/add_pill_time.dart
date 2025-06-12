import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedTime extends StatelessWidget {
  const MedTime({super.key, required this.onTap, required this.displayedTime});
  final VoidCallback onTap;
  final String displayedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Medicine Time:', style: kSubTitleStyle),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Med At ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                width: 85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kDisabledColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withValues(alpha: 0.06), // very subtle shadow
                      blurRadius: 8,
                      offset: Offset(0, 8.5),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      displayedTime,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
