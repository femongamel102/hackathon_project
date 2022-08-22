import 'package:dartz/dartz.dart';
import 'package:hackathon_project/data/data_source/remote_data_source.dart';
import 'package:hackathon_project/data/mapper/mapper.dart';
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
      final response = await _remoteDataSource.login(loginRequest);
      if(response.type == "Success"){
        // success
        return Right(response.toDomain());
      }else{
        // failure
        return Left(Failure(400,response.message ?? "business Error Message"));
      }
    } else {
      // return internet connection error
      return Left(Failure(501,"please check your internet connection"));
    }
  }
}
