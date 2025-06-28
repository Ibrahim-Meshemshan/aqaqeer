// ignore_for_file: avoid_renaming_method_parameters

import 'package:either_dart/either.dart';


import '../../../../core/common/network/failure.dart';
import '../../../../core/use_case.dart';
import '../entities/login_params.dart';
import '../repos/auth_repository.dart';


class LoginUseCase extends UseCase<dynamic,LoginParams>{

  late final AuthRepository authRepository;
  @override
  Future<Either<Failure, dynamic>> call(LoginParams params) async {
    return await authRepository.login(loginParams: params);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[];

}