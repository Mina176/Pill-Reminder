import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../models/dose_model.dart';

class CustomAnimatedBtn extends StatefulWidget {
  const CustomAnimatedBtn({
    super.key,
    required this.dose,
  });
  final DoseModel dose;
  @override
  State<CustomAnimatedBtn> createState() => _CustomAnimatedBtnState();
}

class _CustomAnimatedBtnState extends State<CustomAnimatedBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.dose.isTaken = !(widget.dose.isTaken ?? false);
          widget.dose.save();
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: widget.dose.isTaken ?? false ? Colors.green : kBtnColor,
            borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: widget.dose.isTaken ?? false
              ? FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Medicine Taken ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.check,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Take Medicine',
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
