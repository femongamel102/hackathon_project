import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon_project/domain/model/models.dart';
import 'package:hackathon_project/presentation/base/baseviewmodel.dart';
import 'package:hackathon_project/presentation/onboarding/pages/home/view/home_view.dart';
import 'package:hackathon_project/presentation/onboarding/pages/notifications/view/notification_view.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController = StreamController<PageViewWidgets>();
  int _currentIndex = 0;
  late final List<Widget> _list;
  //OnBoarding ViewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderWidgets();
    _postWidgetToView();
  }

  @override
  void goToPage() {
    // TODO: implement goToPage
  }

  @override
  int onPageChanged(int index) {
    _currentIndex = index;
    _postWidgetToView();
    return index;
  }

  @override
  Sink get inputPageViewWidget => _streamController.sink;

  @override
  Stream<PageViewWidgets> get outputPageViewWidget =>
      _streamController.stream.map((pageViewWidgets) => pageViewWidgets);

// onboarding ViewModel private functions
  void _postWidgetToView() {
    inputPageViewWidget.add(PageViewWidgets(_list[_currentIndex],_list.length,_currentIndex));
  }

  List<Widget> _getSliderWidgets() => [
        const Center(
          child: Text('leave'),
        ),
        const Center(
          child: Text('scanner'),
        ),
        const HomeView(),
        const NotificationView(),
        const Center(
          child: Text('personal'),
        ),
      ];
}

//Inputs mean that "Orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  void goToPage();
  int onPageChanged(int index);

  Sink get inputPageViewWidget;
}

//stream controller outputs
abstract class OnBoardingViewModelOutputs {
  Stream<PageViewWidgets> get outputPageViewWidget;
}
