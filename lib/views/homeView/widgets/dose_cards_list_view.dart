import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return widget.alldoses == null
        ? Center(child: Text('No Doses yet!'))
        : Expanded(
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
                          extentRatio: 0.3,
                          motion: DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => takePill(index),
                              backgroundColor: Colors.green,
                              icon: Icons.check,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                              label: 'Take Pill',
                            ),
                          ],
                        ),
                        child: DoseCard(
                          doseModel: widget.alldoses![index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalisView(dose: widget.alldoses![index],)
                                ));
                          },
                        ));
                  }),
            ),
          ));
  }

  takePill(int index) {
    setState(() {
      Hive.box<DoseModel>(kDoseBox).deleteAt(index);
    });
  }
}
