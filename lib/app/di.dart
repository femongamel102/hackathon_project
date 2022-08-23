import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hackathon_project/app/app_prefs.dart';
import 'package:hackathon_project/data/data_source/remote_data_source.dart';
import 'package:hackathon_project/data/network/app_api.dart';
import 'package:hackathon_project/data/network/dio_factory.dart';
import 'package:hackathon_project/data/network/network_info.dart';
import 'package:hackathon_project/data/repository/repository_impl.dart';
import 'package:hackathon_project/domain/repository/repository.dart';
import 'package:hackathon_project/domain/usecase/login_usecase.dart';
import 'package:hackathon_project/presentation/auth/pages/login/viewmodel/login_viewmodel.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //app module its a module where we put all generic dependencies
  //shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //app prefs instace   ' instace() == sharedPrefs == instace<SharedPreference>()
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory
  instance.registerLazySingleton(() => DioFactory(instance()));

  //app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //repository
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));
    instance.registerFactory<LoginViewModel>(
        () => LoginViewModel(instance<LoginUseCase>()));
  }
}
