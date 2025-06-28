import 'dart:developer';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/common/config/lang/state/store_current_lang.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../core/common/network/error_handler.dart';
import '../../../../../core/common/network/failure.dart';
import '../../../../../core/common/network/netword_info.dart';
import '../../../../../core/common/storage/cash_helper.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../auth/data/models/save_fcm_token_model.dart';
import '../../domain/entity/save_fcm_token_param.dart';
import '../../domain/entity/send_error_param.dart';
import '../../domain/repository/app_manager_repository.dart';
import '../data_source/local/app_manager_local.dart';
import '../data_source/remote/app_manager_remote.dart';
import '../model/app_info_model.dart';
import '../model/delete_fcm_token_model.dart';
import '../model/permissions_model.dart';

class AppManagerRepoImp extends AppManagerRepository {
  AppManagerRemote remote;
  AppManagerLocal local;
  final NetworkInfo networkInfo;

  AppManagerRepoImp(
      {required this.remote, required this.local, required this.networkInfo});

  @override
  Future<Either<Failure, SaveFcmTokenModel>> saveFcmToken(
      {required SaveFcmTokenParams saveFcmTokenParams}) async {
    if (await networkInfo.isConnected) {
      try {
        SaveFcmTokenModel saveFcmTokenModel = await remote.saveFcmToken(
          saveFcmTokenParams: saveFcmTokenParams,
        );
        local.saveFCMToken(saveFcmTokenParams.fcmToken);
        return Right(
          saveFcmTokenModel,
        );
      } catch (error) {
        debugPrint('fcm error${error.toString()}');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DeleteUserTokenModel>> deleteFcmToken(
      {required String fcmToken}) async {
    if (await networkInfo.isConnected) {
      try {
        DeleteUserTokenModel deleteFcmTokenModel = await remote.deleteFcmToken(
          fcmToken: fcmToken,
        );
        local.removeFCMToken();
        return Right(
          deleteFcmTokenModel,
        );
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AppInfoModel>> getAppInfo(
      {required String customerCode}) async {
    if (await networkInfo.isConnected) {
      try {
        AppInfoModel appInfoModel = await remote.getAppInfo(customerCode);

        if (locator.get<LanguageStorage>().getCurrentLang() == null) {
          if (appInfoModel.data?.lOCALLANG != null) {
            locator
                .get<LanguageStorage>()
                .saveCurrentLang(appInfoModel.data?.lOCALLANG ?? '');
          } else {
            final String defaultLocale = Platform.localeName.split('_')[0];
            locator.get<LanguageStorage>().saveCurrentLang(defaultLocale);
          }
        }
        local.saveBaseUrl(appInfoModel.data?.bASEURL ?? '');
        local.saveCustomer(appInfoModel);
       local.saveLogoPath(appInfoModel.data?.lOGO ?? '');
       local.saveClientCode(appInfoModel.data?.cLIENTCODE??'');
       log('the base url is ${ locator.get<CashHelper>().getString(AppStrings.BASE_URL_KEY)??''}');
       log('the base url is ${ locator.get<CashHelper>().getString(AppStrings.BASE_URL_KEY)??''}');
       log('the base url in the app url is ${ AppUrl.baseUrl}');
       log('the base url in the app url is ${ AppUrl.baseUrl}');
        return Right(appInfoModel);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PermissionsModel>> getPermissions() async {
    if (await networkInfo.isConnected) {
      try {
        PermissionsModel permissionsModel = await remote.getPermissions();
        log('Caught right from ');

        return Right(permissionsModel);
      } catch (error) {
        log('Caught error from repo : ${error.toString()}');

        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> sendError(
      {required ErrorParam errorParam}) async {
    if (await networkInfo.isConnected) {
      try {
        dynamic response = await remote.sendError(errorParam: errorParam);
        log('Caught right from sendError ${response.toString()}');

        return Right(response);
      } catch (error) {
        log('Caught error from repo : ${error.toString()}');

        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}
