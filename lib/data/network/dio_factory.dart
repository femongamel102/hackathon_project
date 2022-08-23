import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hackathon_project/app/app_prefs.dart';
import 'package:hackathon_project/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const AUTHORIZATION = "Authorization";
const ACCEPT = "Accept";
const APPLICATION_JSON = 'application/json';
const locale = "locale";
const CONTENT_TYPE = "Content-Type";
const keyBearer = "Bearer";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    //String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: "SEND TOKEN HERE",
      //DEFAULT_LANGUAGE: language,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
    );
    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
