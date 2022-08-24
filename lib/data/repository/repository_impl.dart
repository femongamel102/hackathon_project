import 'package:dartz/dartz.dart';
import 'package:hackathon_project/data/data_source/remote_data_source.dart';
import 'package:hackathon_project/data/mapper/mapper.dart';
import 'package:hackathon_project/data/network/error_handler.dart';
import 'package:hackathon_project/data/network/failure.dart';
import 'package:hackathon_project/data/network/network_info.dart';
import 'package:hackathon_project/data/network/requests.dart';
import 'package:hackathon_project/domain/model/models.dart';
import 'package:hackathon_project/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet so it's safe to call api
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.type == ApiInternalStatus.Success) {
          // success
          return Right(response.toDomain());
        } else {
          // failure
          return Left(
              Failure(ResponseCode.BAD_REQUEST, response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Authentication>> signup(SignUpRequest signUpRequest) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
