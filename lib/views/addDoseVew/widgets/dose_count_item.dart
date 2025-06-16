import 'package:flutter/material.dart';
import '../../../constants.dart';

class DoseCountItem extends StatelessWidget {
  const DoseCountItem({
    super.key,
    required this.count,
    this.onPressed,
    required this.isSelected,
  });
  final int count;
  final bool? isSelected;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              color: isSelected ?? false ? kPrimaryColor : Colors.white,
              border: Border.all(
                color: isSelected ?? false ? kPrimaryColor : kDisabledColor,
                width: 1.25,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: 0.06), // very subtle shadow
                  blurRadius: 8,
                  offset: Offset(0, 8),
                ),
              ]),
          child: Center(
            child: Text(
              '${count + 1}',
              style: TextStyle(
                  color: isSelected ?? false ? Colors.white : kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
