import 'package:flutter/material.dart';

class AlertToggle extends StatelessWidget {
  const AlertToggle({
    super.key,
    required this.onPressed,
    required this.alertOn,
  });

  final VoidCallback onPressed;
  final bool alertOn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          size: 28,
          alertOn == true ? Icons.notifications : Icons.notifications_off,
        ),
      ),
    );
  }
}
