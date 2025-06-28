import 'package:either_dart/either.dart';
import '../../../../core/common/network/failure.dart';
import '../../data/model/get_user_notification_type.dart';
import '../../data/model/notification_model.dart';
import '../../data/model/notification_status_model.dart';
import '../../data/model/notification_type_model.dart';
import '../../data/model/save_type_model.dart';
import '../entities/save_notification_type_params.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationModel>> getNotification();

  Future<Either<Failure, bool>> updateNotifierRead(
      {String? isRead, String? id});

  Future<Either<Failure, NotificationStatueModel>> getNotificationState();

  Future<Either<Failure, NotificationTypeModel>> notificationType();

  Future<Either<Failure, saveNotificationTypeModel>> saveNotificationType(
      {required SaveNotificationParams saveNotificationParams});

  Future<Either<Failure, GetUserNotificationTypeModel>>
      getUserNotificationType();
}
