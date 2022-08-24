import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/app/app_prefs.dart';
import 'package:hackathon_project/app/di.dart';
import 'package:hackathon_project/presentation/auth/pages/login/viewmodel/login_viewmodel.dart';
import 'package:hackathon_project/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/font_manager.dart';
import 'package:hackathon_project/presentation/resources/routes_manager.dart';
import 'package:hackathon_project/presentation/resources/strings_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start(); // tell view model start ur jop
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        //Navigate to main Screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                    _viewModel.login();

                  }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                  stream: _viewModel.outIsUserNameValid,
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.username,
                            style: GoogleFonts.notoSerif(
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.greyText)),
                        SizedBox(
                          height: AppSize.s4,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.usernameError,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                  stream: _viewModel.outIsPasswordValid,
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.password,
                            style: GoogleFonts.notoSerif(
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.greyText)),
                        SizedBox(
                          height: AppSize.s4,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.passwordError,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: AppSize.s28,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                  stream: _viewModel.outAreAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: AppSize.s45,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: ((snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null),
                          child: const Text(AppStrings.login)),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
