import 'package:hackathon_project/data/network/failure.dart';
import 'package:hackathon_project/data/network/requests.dart';
import 'package:dartz/dartz.dart';
import 'package:hackathon_project/domain/model/models.dart';

abstract class Repository{
   Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
   Future<Either<Failure,String>> forgetPassword(String email);
   Future<Either<Failure,Authentication>> signup(SignUpRequest signUpRequest);

}