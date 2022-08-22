import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';
import 'package:hackathon_project/presentation/widgets/planet_button/planet_elevated_button.dart';

class PlantCard extends StatefulWidget {
  const PlantCard({Key? key}) : super(key: key);

  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      color: ColorManager.cardBackground,
      elevation: AppSize.s1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r10)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -height * .10,
              child: SizedBox(
                width: width * .38,
                height: height * .2,
                child: Image.asset(
                  ImageAssets.imageList,
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
              right: width * .025,
              top: height * .01,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        counter -= 1;
                      });
                    },
                    child: Container(
                      color: ColorManager.minAndPlusColor.withOpacity(0.7),
                      child: const Icon(Icons.remove,
                          color: ColorManager.greyText, size: AppSize.s20),
                    ),
                  ),
                  Text(
                    counter.toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        counter += 1;
                      });
                    },
                    child: Container(
                      color: ColorManager.minAndPlusColor.withOpacity(0.7),
                      child: const Icon(Icons.add,
                          color: ColorManager.greyText, size: AppSize.s20),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: height * .09,
            left: width * .025,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GARDENIA PLANT',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  '70 EGP',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                PlanetElevatedButton(
                  borderRadius: AppRadius.r15,
                  padding: EdgeInsets.symmetric(
                      vertical: AppPadding.p8, horizontal: width * .10),
                  title: AppStrings.addToCart,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
