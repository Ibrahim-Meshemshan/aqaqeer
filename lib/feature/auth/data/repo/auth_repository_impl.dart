import 'dart:developer';
import 'package:either_dart/either.dart';
import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/netword_info.dart';
import '../../../../core/injection/injection.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/repos/auth_repository.dart';
import '../data_source/local/local.dart';
import '../data_source/remote/auth_remote.dart';
import '../models/change_password_model.dart';
import '../../domain/entities/change_password_params.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemote remote;
  final AuthLocal local;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, dynamic>> login({
    required LoginParams loginParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = await remote.login(
          params: loginParams,
        );
        local.saveAuthToken(userModel.data!.tOKEN.toString());
        local.saveAuthUserName(userModel.data?.uSERNAME.toString()??'');
        local.saveAuthFullName(userModel.data?.eXTRA?.fULLNAME.toString()??'');
        local.saveRememberToken(userModel.data?.rEMEMBERTOKEN.toString()??'');
        log('the token is=====================${locator.get<AuthLocal>().getAuthToken()}');
        return Right(userModel);
      } catch (error) {
        log('error in repo: $error');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  Future<Either<Failure, dynamic>> changePassword(
      {required ChangePasswordParam changePasswordParam}) async {
    if (await networkInfo.isConnected) {
      try {
        ChangePasswordModel changePasswordModel = await remote.getChangePassword(
          changePasswordParam: changePasswordParam,
        );
        return Right(
          changePasswordModel,
        );
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }
}
