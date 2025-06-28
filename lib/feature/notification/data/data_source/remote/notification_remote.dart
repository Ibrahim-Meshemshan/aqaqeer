import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/network/dio/dio_client.dart';
import '../../../../../core/injection/injection.dart';
import '../../../domin/entities/save_notification_type_params.dart';
import '../../model/get_user_notification_type.dart';
import '../../model/notification_model.dart';
import '../../model/notification_status_model.dart';
import '../../model/notification_type_model.dart';
import '../../model/save_type_model.dart';

class NotifierRemote {
  DioClient dioClient = locator.get<DioClient>();

  Future<NotificationModel> getNotification() async {
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.getNotification,
    );

    return NotificationModel.fromJson(response.data);
  }

  Future<Response> updateNotifierRead({String? isRead, String? id}) async {
    late final Response response;
    response = await dioClient.post(
        url: AppUrl.updateNotifier,
        data: {"isRead": isRead, "announcementHisToId": id});

    return response;
  }

  Future<NotificationStatueModel> getNotificationState() async {
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.unReadNotification,
    );
    return NotificationStatueModel.fromJson(response.data);
  }

  Future<NotificationTypeModel> getNotificationType() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.getNotificationType,
    );
    debugPrint(
        'the Response for news with body is ==============${response.data}');
    return NotificationTypeModel.fromJson(response.data);
  }

  Future<saveNotificationTypeModel> saveNotificationType(
      SaveNotificationParams saveNotificationParams) async {
    late final Response response;
    response = await dioClient.dioPost(
        url: AppUrl.saveNotificationType,
        data: saveNotificationParams,
        contentType: Headers.jsonContentType
    );
    return saveNotificationTypeModel.fromJson(response.data);
  }

  Future<GetUserNotificationTypeModel> getUserNotificationType() async {
    late final Response response;
    response = await dioClient.get(url: AppUrl.getNotificationUserType);
    debugPrint(
        'the Response for news with body is ==============${response.data}');
    return GetUserNotificationTypeModel.fromJson(response.data);
  }
}
