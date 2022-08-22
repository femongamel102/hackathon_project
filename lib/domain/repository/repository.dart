import 'package:hackathon_project/data/network/failure.dart';
import 'package:hackathon_project/data/network/requests.dart';
import 'package:dartz/dartz.dart';
import 'package:hackathon_project/domain/model/models.dart';

abstract class Repository{
   Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}