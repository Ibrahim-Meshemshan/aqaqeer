import 'package:aqaqeer/feature/auth/data/models/signup_model.dart';
import 'package:aqaqeer/feature/auth/domain/entities/signup_params.dart';
import 'package:either_dart/either.dart';

import '../../../../core/common/network/failure.dart';
import '../entities/login_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> login({required LoginParams loginParams});
  Future<Either<Failure, SignupModel>> signup({required SignupParams signupParams});
}
