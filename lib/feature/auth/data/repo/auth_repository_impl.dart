import 'dart:developer';
import 'package:aqaqeer/feature/auth/data/models/signup_model.dart';
import 'package:aqaqeer/feature/auth/data/models/user_model.dart';
import 'package:aqaqeer/feature/auth/domain/entities/signup_params.dart';
import 'package:either_dart/either.dart';
import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/netword_info.dart';
import '../../../../core/injection/injection.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/repos/auth_repository.dart';
import '../data_source/local/local.dart';
import '../data_source/remote/auth_remote.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemote remote;
  final AuthLocal local;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, dynamic>> login({
    required LoginParams loginParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = await remote.login(login: loginParams);
        await local.saveAuthToken(userModel.accessToken.toString());
        await local.saveRememberToken(userModel.refreshToken!.toString());
        log(
          'the token is=====================${locator.get<AuthLocal>().getAuthToken()}',
        );
        return Right(userModel);
      } catch (error) {
        log('error repo :$error');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, SignupModel>> signup({
    required SignupParams signupParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        SignupModel signupModel = await remote.signUp(signup: signupParams);
        await local.saveAuthToken(signupModel.accessToken.toString());
        await local.saveRememberToken(signupModel.refreshToken!.toString());
        log(
          'the token is=====================${locator.get<AuthLocal>().getAuthToken()}',
        );
        return Right(signupModel);
      } catch (error) {
        log('signup error repo :$error');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

  // Future<Either<Failure, dynamic>> changePassword(
  //     {required ChangePasswordParam changePasswordParam}) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       ChangePasswordModel changePasswordModel = await remote.getChangePassword(
  //         changePasswordParam: changePasswordParam,
  //       );
  //       return Right(
  //         changePasswordModel,
  //       );
  //     } catch (error) {
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  //
  // }
