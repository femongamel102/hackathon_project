import 'package:flutter/material.dart';
import 'package:hackathon_project/app/di.dart';
import 'package:hackathon_project/presentation/auth/pages/login/view/login_view.dart';
import 'package:hackathon_project/presentation/auth/view/auth_view.dart';
import 'package:hackathon_project/presentation/forgot_password/forgot_password_view.dart';
import 'package:hackathon_project/presentation/main/main_view.dart';
import 'package:hackathon_project/presentation/onboarding/view/onboarding_view.dart';
import 'package:hackathon_project/presentation/register/register_view.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/splash/splash_view.dart';
import 'package:hackathon_project/presentation/store_details/store_details_view.dart';

class Routes{
  static const String splashRoute= "/";
  static const String loginRoute= "/auth";
  static const String authRoute= "/login";
  static const String registerRoute= "/register";
  static const String forgotPasswordRoute= "/forgotPassword";
  static const String onBoardingRoute= "/onBoarding";
  static const String mainRoute= "/main";
  static const String storeDetailsRoute= "/storeDetails";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case Routes.authRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=> const AuthPageMob());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnBoardingView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const StoreDetailsView());
      default:
        return unDefinedRoute();

    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=> Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound),),
      body: const Center(
        child: Text(AppStrings.noRouteFound),
      ),
    ));
  }
}