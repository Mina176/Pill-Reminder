import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pill_reminder/models/dose_model.dart';
import 'package:pill_reminder/views/homeView/widgets/custom_date_picker.dart';
import '../../../constants.dart';
import 'dose_cards_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    fetchAllDoses();
    super.initState();
  }

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDatePicker(),
        ValueListenableBuilder(
          valueListenable: Hive.box<DoseModel>(kDoseBox).listenable(),
          builder: (context, Box<DoseModel> box, _) {
            final alldoses = box.values.toList();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (controller.hasClients) {
                controller.jumpTo(controller.position.maxScrollExtent);
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
}

class NoDoses extends StatelessWidget {
  const NoDoses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No Doses yet !",
            style: kTitleStyle,
          ),
          Text(
            'Click on \'Add New Dose\'',
            style: kTitleStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
