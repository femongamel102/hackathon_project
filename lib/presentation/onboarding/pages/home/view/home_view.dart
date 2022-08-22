import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/onboarding/pages/home/view/widgets/horizontal_list_widget.dart';
import 'package:hackathon_project/presentation/onboarding/pages/home/view/widgets/plant_home_list.dart';
import 'package:hackathon_project/presentation/onboarding/pages/home/view/widgets/search_widget.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';
import 'package:hackathon_project/presentation/widgets/planet_logo_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(AppPadding.p18),
            child: PlanetLogoWidget.Logo(),
          ),
          const SearchInput(),
          const HorizontalList(),
          SizedBox(
              height: height *.6,
              child: const PlantHomeList()),

        ],
      ),
    );
  }
}
