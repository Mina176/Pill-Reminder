import 'package:flutter/material.dart';
import '../../../constants.dart';

class DoseCountItem extends StatelessWidget {
  const DoseCountItem({
    super.key,
    required this.count,
    required this.onPressed,
    required this.isSelected,
  });
  final int count;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.white,
            border: Border.all(
              color: isSelected ? kPrimaryColor : kDisabledColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              '${count + 1}',
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
