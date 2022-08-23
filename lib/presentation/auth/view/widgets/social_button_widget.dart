import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class AuthSocialButtonWidget extends StatelessWidget {
  final VoidCallback onPressCallBack;
  final String iconPath;
  final Color color;

  const AuthSocialButtonWidget(
      {Key? key,
      required this.onPressCallBack,
      required this.iconPath,
      this.color = ColorManager.authSocialBackground})
      : super(key: key);

  const AuthSocialButtonWidget.facebook(
      {Color? color, required VoidCallback onPressCallBack})
      : this(
          key: const Key('facebook'),
          onPressCallBack: onPressCallBack,
          iconPath: ImageAssets.facebookLogo,
        );

  const AuthSocialButtonWidget.google({required VoidCallback onPressCallBack})
      : this(
          key: const Key('google'),
          onPressCallBack: onPressCallBack,
          iconPath: ImageAssets.googleLogo,
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: ColorManager.scaffoldBackground,
          primary: Colors.black,
          elevation: 0),
      child: Image.asset(
        iconPath,
        width: AppSize.s40,
        height: AppSize.s40,
      ),
    );
  }
}
