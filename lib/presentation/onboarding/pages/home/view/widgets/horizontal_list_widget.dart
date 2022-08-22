import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';
import 'package:hackathon_project/presentation/widgets/planet_button/planet_elevated_button.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButtons(AppStrings.all, () {
            setState(() {
              selected = 0;
            });
          }, 0),
          _buildButtons(AppStrings.plants, () {
            setState(() {
              selected = 1;
            });
          }, 1),
          _buildButtons(AppStrings.seeds, () {
            setState(() {
              selected = 2;
            });
          }, 2),
          _buildButtons(AppStrings.tools, () {
            setState(() {
              selected = 3;
            });
          }, 3),
        ],
      ),
    );
  }

  Widget _buildButtons(String title, VoidCallback function, int index) {
    return PlanetElevatedButton(
      borderRadius: AppRadius.r10,
      borderSide: BorderSide(
        width: AppSize.s1_5,
        color: selected == index ? ColorManager.primary : ColorManager.hLBInActive,
      ),
      elevation: AppSize.s0,
      padding: EdgeInsets.zero,
      title: title,
      onPressed: function,
      backgroundColor:
          selected == index ? ColorManager.hLBActive : ColorManager.hLBInActive,
      colorText: selected == index ? ColorManager.primary : ColorManager.greyText,
    );
  }
}
