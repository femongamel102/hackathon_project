import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/auth/pages/login/view/login_view.dart';
import 'package:hackathon_project/presentation/auth/view/widgets/social_button_widget.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';
import 'package:hackathon_project/presentation/widgets/planet_button/planet_text_button.dart';
import 'package:hackathon_project/presentation/widgets/planet_logo_widget.dart';

class AuthPageMob extends StatefulWidget {
  const AuthPageMob({Key? key}) : super(key: key);

  @override
  State<AuthPageMob> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPageMob> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                  child: _quoteIconWidget(
                      AlignmentDirectional.topEnd,
                      ImageAssets.topRightFlower,
                      ColorManager.primary,
                      width * .3,
                      height * .20)),
              Positioned(
                  child: _quoteIconWidget(
                      AlignmentDirectional.bottomStart,
                      ImageAssets.bottomLeftFlower,
                      ColorManager.primary,
                      width * .3,
                      height * .4)),
              Positioned(
                  top: height * .12,
                  left: width * .35,
                  child: const PlanetLogoWidget.Logo()),
              Positioned(
                top: height * .21,
                child: SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _titleWidget(width),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      // selected
                      //     ? SignUpFormMob(
                      //         signUpClickedCallBack:
                      //             (SendSignUpModel sendSignUpModel) {},
                      //       )
                      //     :
                      const LoginView(),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: AppSize.s20),
                        width: width * .68,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: ColorManager.divider,
                                      width: AppSize.s1),
                                ),
                              ),
                            )),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                'or continue with',
                                style: TextStyle(color: ColorManager.greyText),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: ColorManager.greyText,
                                      width: AppSize.s_5),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthSocialButtonWidget.google(onPressCallBack: () {}),
                          const SizedBox(width: AppSize.s10),
                          AuthSocialButtonWidget.facebook(
                              onPressCallBack: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget(double width) {
    return SizedBox(
      width: width * .7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              PlanetTextButton(
                  padding: EdgeInsets.zero,
                  color:
                      selected ? ColorManager.primary : ColorManager.greyText,
                  onPressed: () {
                    setState(() {
                      selected = true;
                    });
                  },
                  title: AppStrings.signUp),
              _underLineWidget(selected),
            ],
          ),
          Column(
            children: [
              PlanetTextButton(
                  padding: EdgeInsets.zero,
                  color:
                      !selected ? ColorManager.primary : ColorManager.greyText,
                  onPressed: () {
                    setState(() {
                      selected = false;
                    });
                  },
                  title: "Login"),
              _underLineWidget(!selected),
            ],
          ),
        ],
      ),
    );
  }

  Widget _underLineWidget(bool selected) {
    return Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: AppSize.s40,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: AppSize.s2,
                    color: selected
                        ? ColorManager.primary
                        : ColorManager.transparent))));
  }

  Widget _quoteIconWidget(AlignmentDirectional alignment, String image,
      Color color, double width, double height) {
    return Align(
      alignment: alignment,
      child: Image.asset(
        alignment: alignment,
        image,
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
