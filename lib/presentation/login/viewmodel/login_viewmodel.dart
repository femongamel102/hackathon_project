// import 'dart:async';
//
//
//
// class LoginViewModel extends BaseViewModel
//     with LoginViewModelInputs, LoginViewModelOutputs {
//   final StreamController _userNameStreamController =
//       StreamController<String>.broadcast();
//   final StreamController _passwordStreamController =
//       StreamController<String>.broadcast();
//   final StreamController _areAllInputsStreamController =
//       StreamController<void>.broadcast();
//
//   StreamController isUserLoggedInSuccessfullyStreamController =
//       StreamController<bool>();
//
//   var loginObject = LoginObject("", "");
//
//   final LoginUseCase _loginUseCase;
//   LoginViewModel(this._loginUseCase);
//
//   //inputs
//   @override
//   void dispose() {
//     super.dispose();
//     _userNameStreamController.close();
//     _passwordStreamController.close();
//     _areAllInputsStreamController.close();
//     isUserLoggedInSuccessfullyStreamController.close();
//   }
//
//   @override
//   void start() {
//     inputState.add(ContentState());
//   }
//
//   @override
//   Sink get inputPassword => _passwordStreamController.sink;
//
//   @override
//   Sink get inputUserName => _userNameStreamController.sink;
//
//   @override
//   Sink get inputAreAllInputsValid => _areAllInputsStreamController.sink;
//
//   @override
//   setPassword(String password) {
//     inputPassword.add(password);
//     loginObject = loginObject.copyWith(password: password);
//     inputAreAllInputsValid.add(null);
//   }
//
//   @override
//   setUserName(String username) {
//     inputUserName.add(username);
//     loginObject = loginObject.copyWith(userName: username);
//     inputAreAllInputsValid.add(null);
//   }
//
//   @override
//   login() async {
//     try{
//     inputState.add(
//         LoadingState(stateRendererType: StateRendererType.popupLoadingState));
//     (await _loginUseCase.execute(
//             LoginUseCaseInput(loginObject.userName, loginObject.password)))
//         .fold(
//             (failure) => {
//                   //left => failure
//                   inputState.add(ErrorState(
//                       StateRendererType.popupErrorState, failure.message)),
//                 },
//             (data) {
//                   print(data);
//                   //right => success
//                   //content
//                   inputState.add(ContentState());
//                   //navigate to main screen
//                   isUserLoggedInSuccessfullyStreamController.add(true);
//                 });}
//         catch(error){
//           print(error.toString());
//         }
//   }
//
//   //outputs
//   @override
//   Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
//       .map((password) => _isPasswordValid(password));
//
//   @override
//   Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
//       .map((userName) => _isUserNameValid(userName));
//
//   @override
//   Stream<bool> get outAreAllInputsValid =>
//       _areAllInputsStreamController.stream.map((_) => _areAllInputsValid());
//
//   bool _isPasswordValid(String password) {
//     return password.isNotEmpty;
//   }
//
//   bool _isUserNameValid(String userName) {
//     return userName.isNotEmpty;
//   }
//
//   bool _areAllInputsValid() {
//     return _isPasswordValid(loginObject.password) &&
//         _isUserNameValid(loginObject.userName);
//   }
// }
//
// abstract class LoginViewModelInputs {
//   setUserName(String username);
//   setPassword(String password);
//   login();
//
//   Sink get inputUserName;
//   Sink get inputPassword;
//   Sink get inputAreAllInputsValid;
// }
//
// abstract class LoginViewModelOutputs {
//   Stream<bool> get outIsUserNameValid;
//   Stream<bool> get outIsPasswordValid;
//   Stream<bool> get outAreAllInputsValid;
// }
