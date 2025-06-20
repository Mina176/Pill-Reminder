import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/homeView/widgets/custom_date_picker.dart';
import '../../../constants.dart';
import 'dose_cards_list_view.dart';
import 'no_doses.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController controller = ScrollController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDatePicker(
            selectedDate: selectedDate, onIconPressed: () => pickDate()),
        ValueListenableBuilder(
          valueListenable: Hive.box<DoseModel>(kDoseBox).listenable(),
          builder: (context, Box<DoseModel> box, _) {
            final alldoses = box.values.toList();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (controller.hasClients) {
              }
            });
            if (box.values.isEmpty) return NoDoses();
            return DoseCardsListView(
              alldoses: alldoses,
              controller: controller,
            );
          },
        ),
      ],
    );
  }

  Future pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

