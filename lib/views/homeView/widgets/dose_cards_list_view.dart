import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/detailsView/detalis_view.dart';

import '../../../constants.dart';
import 'dose_card.dart';

class DoseCardsListView extends StatefulWidget {
  const DoseCardsListView({
    super.key,
    required this.alldoses,
    required this.controller,
  });

  final List<DoseModel>? alldoses;
  final ScrollController? controller;

  @override
  State<DoseCardsListView> createState() => _DoseCardsListViewState();
}

class _DoseCardsListViewState extends State<DoseCardsListView> {
  bool isTaken = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SlidableAutoCloseBehavior(
        closeWhenOpened: true,
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 15),
            controller: widget.controller,
            itemCount: widget.alldoses!.length,
            itemBuilder: (context, index) {
              return Slidable(
                  closeOnScroll: true,
                  endActionPane: ActionPane(
                    extentRatio: 0.31,
                    motion: DrawerMotion(),
                    children: [
                      widget.alldoses![index].isTaken
                          ? SlidableAction(
                              onPressed: (context) => toggleTakeMed(index),
                              backgroundColor: kDisabledColor,
                              icon: FontAwesomeIcons.rotateLeft,
                              borderRadius: buildBorder(),
                              label: 'Untake Med',
                            )
                          : SlidableAction(
                              onPressed: (context) => toggleTakeMed(index),
                              backgroundColor: Colors.green,
                              icon: FontAwesomeIcons.check,
                              borderRadius: buildBorder(),
                              label: 'Take Med',
                            ),
                    ],
                  ),
                  child: DoseCard(
                    dose: widget.alldoses![index],
                    onTap: () => doseCardOnTap(index),
                    alertOnPressed: () => alertOnPressed(index),
                  ));
            }),
      ),
    ));
  }

  void toggleTakeMed(int index) {
    final dose = Hive.box<DoseModel>(kDoseBox).getAt(index);

    if (dose != null && dose.isTaken == false) {
      dose.isTaken = true;
      dose.save();
    } else if (dose != null && dose.isTaken == true) {
      dose.isTaken = false;
      dose.save();
    }
  }

  doseCardOnTap(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalisView(
          dose: widget.alldoses![index],
        ),
      ),
    );
  }

  alertOnPressed(int index) {
    setState(() {
      widget.alldoses![index].remind = !(widget.alldoses![index].remind);
    });
  }

  buildBorder() {
    return BorderRadius.only(
        topRight: Radius.circular(16), bottomRight: Radius.circular(16));
  }
}


