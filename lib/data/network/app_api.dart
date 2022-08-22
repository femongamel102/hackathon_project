import 'package:dio/dio.dart';
import 'package:hackathon_project/app/constants.dart';
import 'package:hackathon_project/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @POST("auth/signin")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );

}