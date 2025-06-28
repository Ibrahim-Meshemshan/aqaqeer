import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/netword_info.dart';
import '../../domin/entities/save_notification_type_params.dart';
import '../../domin/repo/notification_repository.dart';
import '../data_source/remote/notification_remote.dart';
import '../model/get_user_notification_type.dart';
import '../model/notification_model.dart';
import '../model/notification_status_model.dart';
import '../model/notification_type_model.dart';
import '../model/save_type_model.dart';

class NotifierRepoImp extends NotificationRepository {
  final NotifierRemote remote;
  final NetworkInfo networkInfo;

  NotifierRepoImp({required this.networkInfo, required this.remote});

  @override
  Future<Either<Failure, NotificationModel>> getNotification() async {
    if (await networkInfo.isConnected) {
      try {
        NotificationModel model = await remote.getNotification();
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateNotifierRead(
      {String? isRead, String? id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response =
            await remote.updateNotifierRead(id: id, isRead: isRead);
        return Right(response.data['success']);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, NotificationStatueModel>>
      getNotificationState() async {
    if (await networkInfo.isConnected) {
      try {
        NotificationStatueModel response = await remote.getNotificationState();
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, NotificationTypeModel>> notificationType() async {
    if (await networkInfo.isConnected) {
      try {
        NotificationTypeModel model = await remote.getNotificationType();
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, saveNotificationTypeModel>> saveNotificationType({
    required SaveNotificationParams saveNotificationParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        saveNotificationTypeModel model =
        await remote.saveNotificationType(saveNotificationParams);
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, GetUserNotificationTypeModel>> getUserNotificationType() async {
    if (await networkInfo.isConnected) {
      try {
        GetUserNotificationTypeModel response =
        await remote.getUserNotificationType();
        log("*********************print" + response.data!.toString());
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}
