import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.onTap,
    this.color = kBtnColor,
    this.widget,
    this.label,
  });
  final Color color;
  final Widget? widget;
  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: widget ??
                Text(
                  'Add Medicine',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
