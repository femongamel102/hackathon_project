import 'package:dio/dio.dart';
import 'package:hackathon_project/app/constants.dart';
import 'package:hackathon_project/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/auth/signin")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/auth/forget-password")
  Future<AuthenticationResponse> forgetPassword(@Field("email") String email);

  @POST("/auth/signup")
  Future<AuthenticationResponse> signup(
    @Field("firstName") String firstName,
    @Field("lastName") String lastName,
    @Field("email") String email,
    @Field("password") String password,
  );
}
