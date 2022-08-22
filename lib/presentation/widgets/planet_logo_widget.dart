import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class PlanetLogoWidget extends StatelessWidget {
  final String assetPath;
  const PlanetLogoWidget({Key? key, required this.assetPath}) : super(key: key);
  const PlanetLogoWidget.Logo({Key? key})
      : this(assetPath: ImageAssets.planetLogo, key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: AppPadding.p120,
      height: AppSize.s40,
    );
  }
}
