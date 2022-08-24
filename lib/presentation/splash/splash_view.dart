import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hackathon_project/app/app_prefs.dart';
import 'package:hackathon_project/app/di.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/constants_manager.dart';
import 'package:hackathon_project/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)}
          else
            {Navigator.pushReplacementNamed(context, Routes.authRoute)}
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Center(
          child: Image(
        image: AssetImage(ImageAssets.splashLogo),
      )),
    );
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
