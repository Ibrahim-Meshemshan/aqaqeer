import 'package:either_dart/either.dart';

import '../../../../core/common/network/failure.dart';
import '../entities/login_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> login({required LoginParams loginParams});
}
