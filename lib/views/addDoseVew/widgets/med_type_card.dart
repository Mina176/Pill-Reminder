import 'package:flutter/material.dart';
import 'package:pill_reminder/constants.dart';

class MedTypeCard extends StatelessWidget {
  const MedTypeCard(
      {super.key,
      this.onPressed,
      required this.isSelected,
      required this.icon,
      required this.cardColor,
      required this.formInt});
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onPressed;
  final Color cardColor;
  final int formInt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: cardColor,
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withValues(alpha: 0.06), // very subtle shadow
                blurRadius: 8,
                offset: Offset(0, 8),
              ),
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: isSelected ? Colors.white : kPrimaryColor,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                intFormToString(
                  formInt,
                ),
                style: TextStyle(
                    fontSize: 20,
                    color: isSelected ? Colors.white : kPrimaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
