import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailsDoseCountItem extends StatelessWidget {
  const DetailsDoseCountItem({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withValues(alpha: 0.1), // very subtle shadow
                blurRadius: 8,
              ),
            ]),
        child: Center(
          child: Text(
            '${count + 1}',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
