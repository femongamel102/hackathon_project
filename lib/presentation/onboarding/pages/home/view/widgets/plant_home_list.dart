import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/onboarding/pages/home/view/widgets/plant_card.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class PlantHomeList extends StatefulWidget {
  const PlantHomeList({Key? key}) : super(key: key);

  @override
  State<PlantHomeList> createState() => _PlantHomeListState();
}

class _PlantHomeListState extends State<PlantHomeList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: EdgeInsets.only(top: height * .1, left: AppPadding.p10, right: AppPadding.p10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: height * .08,
            crossAxisCount: 2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => const PlantCard()),
    );
  }
}
