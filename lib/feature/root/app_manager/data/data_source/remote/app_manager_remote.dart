import 'package:dio/dio.dart';
import '../../../../../../core/common/constant/src/app_url.dart';
import '../../../../../../core/common/constant/strings.dart';
import '../../../../../../core/common/network/dio/dio_client.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../auth/data/data_source/local/local.dart';
import '../../../../../auth/data/models/save_fcm_token_model.dart';
import '../../../domain/entity/save_fcm_token_param.dart';
import '../../../domain/entity/send_error_param.dart';
import '../../model/app_info_model.dart';
import '../../model/delete_fcm_token_model.dart';
import '../../model/permissions_model.dart';


class AppManagerRemote {
  DioClient dioClient;
  var dio = Dio();

  AppManagerRemote({required this.dioClient});

  Future<AppInfoModel> getAppInfo(String customerCode) async {
    late final Response response;
    response = await dioClient.get(url: AppUrl.getCustomer, params: {
      'clientCode': customerCode,
      'applicationCode': AppStrings.applicationCode
    });
    return AppInfoModel.fromJson(response.data);
  }

  Future<SaveFcmTokenModel> saveFcmToken({
    required SaveFcmTokenParams saveFcmTokenParams,
  }) async {
    late final Response response;
    var jsonParams = saveFcmTokenParams.toJson();
    response = await dioClient.dioPost(
      data: jsonParams,
      url: AppUrl.getSaveFcmToken,
      param: {
        'token': locator.get<AuthLocal>().getAuthToken(),
        'userTypeCode': 'RAS_USER'
      },
    );

    return SaveFcmTokenModel.fromJson(
      response.data,
    );
  }

  Future<DeleteUserTokenModel> deleteFcmToken({
    required String fcmToken,
  }) async {
    late final Response response;
    var jsonParams = FormData.fromMap({'fcmToken': fcmToken});
    response = await dioClient.dioPost(
      data: jsonParams,
      url: AppUrl.deletFcmToken,
      param: {
        'token': locator.get<AuthLocal>().getAuthToken(),
        'userTypeCode': 'RAS_USER'
      },
    );
    return DeleteUserTokenModel.fromJson(
      response.data,
    );
  }

  // Future<PermissionsModel> getPermissions() async {
  //   late final Response response;
  //    response = await dio.request(
  //     AppUrl.getPermissions,
  //     options: Options(
  //       method: 'GET',
  //       headers: {
  //         'token': 'ad8571bd5007bb3891ccf775284b893e2488a746a7de68f802d9c367195453f0cde5795e211b1385ea674bd35d22744bd1781e9fb4bd327908274566175030ca0',
  //         'userTypeCode': 'RAS_USER'
  //       },
  //     ),
  //   );
  //   return PermissionsModel.fromJson(
  //     response.data,
  //   );
  // }

  Future<PermissionsModel> getPermissions() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.permission,
    );
    return PermissionsModel.fromJson(
      response.data,
    );
  }
  Future<dynamic> sendError( {required ErrorParam errorParam}) async {
    try {
      final response = await dioClient.dioPost(
        url: AppUrl.sendError,
        data: errorParam.toJson(), // Convert ErrorParam to JSON
      );
      return response.data; // Adjust return type if response structure differs
    } catch (e) {
      // Handle any exceptions or errors that occur during the API call
      print('Error sending error data: $e');
      return false;
    }
  }


}
