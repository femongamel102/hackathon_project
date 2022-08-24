import 'package:hackathon_project/data/network/app_api.dart';
import 'package:hackathon_project/data/network/requests.dart';
import 'package:hackathon_project/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<AuthenticationResponse> signup(SignUpRequest signUpRequest);
  //Future<ForgotPasswordResponse> forgetPassword(String email);

}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<AuthenticationResponse> signup(SignUpRequest signUpRequest) async {
    return await _appServiceClient.signup(signUpRequest.firstName,
        signUpRequest.lastName, signUpRequest.email, signUpRequest.password);
  }

  // @override
  // Future forgetPassword(String email) async {
  //   return await _appServiceClient.forgetPassword(email);
  // }
}
