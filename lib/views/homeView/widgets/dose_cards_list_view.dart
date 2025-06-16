import 'package:flutter/cupertino.dart';
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
                          extentRatio: 0.31,
                          motion: DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    content: Text(
                                        'Are You Sure you want to delete Medication?'),
                                    actions: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Center(
                                          child: Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          removeMed(index);
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              backgroundColor: Colors.red,
                              icon: FontAwesomeIcons.xmark,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                              label: 'Remove Med',
                            ),
                          ],
                        ),
                        child: DoseCard(
                          dose: widget.alldoses![index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalisView(
                                  dose: widget.alldoses![index],
                                ),
                              ),
                            );
                          },
                        ));
                  }),
            ),
          ));
  }

  removeMed(int index) {
    setState(() {
      Hive.box<DoseModel>(kDoseBox).deleteAt(index);
    });
  }
}
