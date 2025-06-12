import 'package:flutter/material.dart';

class MedTypeCard extends StatelessWidget {
  const MedTypeCard(
      {super.key,
      required this.onPressed,
      required this.isSelected,
      required this.icon,
      required this.cardColor});
  final Icon icon;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            width: 120,
            decoration: BoxDecoration(
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: 0.06), // very subtle shadow
                  blurRadius: 8,
                  offset: Offset(0, 8),
                ),
              ],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(child: icon)),
      ),
    );
  }
}
