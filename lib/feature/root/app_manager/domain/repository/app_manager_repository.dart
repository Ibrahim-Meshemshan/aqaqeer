import 'package:either_dart/either.dart';
import '../../../../../core/common/network/failure.dart';
import '../../../../auth/data/models/save_fcm_token_model.dart';
import '../../data/model/app_info_model.dart';
import '../../data/model/delete_fcm_token_model.dart';
import '../../data/model/permissions_model.dart';
import '../entity/save_fcm_token_param.dart';
import '../entity/send_error_param.dart';

abstract class AppManagerRepository{


  Future<Either<Failure, SaveFcmTokenModel>> saveFcmToken({
    required SaveFcmTokenParams saveFcmTokenParams,
  });
  Future<Either<Failure, DeleteUserTokenModel>> deleteFcmToken({required String fcmToken});
  Future<Either<Failure,AppInfoModel>> getAppInfo({required String customerCode});
  Future<Either<Failure,PermissionsModel>> getPermissions();
  Future<Either<Failure,dynamic>> sendError( {required ErrorParam errorParam});
}