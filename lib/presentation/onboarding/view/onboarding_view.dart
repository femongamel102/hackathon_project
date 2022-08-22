import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/domain/model/models.dart';
import 'package:hackathon_project/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:hackathon_project/presentation/resources/assets_manager.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/constants_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PageViewWidgets>(
        stream: _viewModel.outputPageViewWidget,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(PageViewWidgets? pageViewWidgets) {
    if (pageViewWidgets == null) {
      return Container();
    } else {
      return Container(
        color: ColorManager.white,
        child: SafeArea(
          //top: false,
          child: Padding(
            padding: const EdgeInsets.only(top: AppPadding.p18),
            child: Scaffold(
              //extendBody: true,
              backgroundColor: ColorManager.white,

              body: PageView.builder(
                  controller: _pageController,
                  itemCount: pageViewWidgets.numberOfPages,
                  onPageChanged: (index) {
                    _viewModel.onPageChanged(index);
                  },
                  itemBuilder: (context, index) {
                    return pageViewWidgets.widget;
                  }),
              bottomNavigationBar: CurvedNavigationBar(
                height: AppSize.s60,
                key: _bottomNavigationKey,
                backgroundColor: ColorManager.white,
                buttonBackgroundColor: ColorManager.primary,
                index: pageViewWidgets.currentIndex,
                items: <Widget>[
                  //todo make enum
                  _buildTap(ImageAssets.leave, 0, pageViewWidgets.currentIndex),
                  _buildTap(
                      ImageAssets.qrCode, 1, pageViewWidgets.currentIndex),
                  _buildTap(ImageAssets.home, 2, pageViewWidgets.currentIndex),
                  _buildTap(ImageAssets.bell, 3, pageViewWidgets.currentIndex),
                  _buildTap(
                      ImageAssets.personal, 4, pageViewWidgets.currentIndex),
                ],
                onTap: (index) {
                  //Handle button tap
                  _pageController.animateToPage(_viewModel.onPageChanged(index),
                      duration: const Duration(
                          milliseconds: AppConstant.sliderAnimationTime),
                      curve: Curves.bounceInOut);
                },
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildTap(String image, int index, int pageIndex) {
    return Image.asset(
      image,
      color: pageIndex == index ? ColorManager.white : ColorManager.black,
      height: AppSize.s30,
      width: AppSize.s30,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
