import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.onTap,
    required this.label,
  });
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kBtnColor, borderRadius: BorderRadius.circular(18)),
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
