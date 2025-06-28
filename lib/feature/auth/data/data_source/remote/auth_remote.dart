import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/network/dio/dio_client.dart';
import '../../../domain/entities/change_password_params.dart';
import '../../../domain/entities/login_params.dart';
import '../../models/change_password_model.dart';
import '../../models/user_model.dart';

class AuthRemote {
  DioClient dioClient;
  final Dio dio;

  AuthRemote({required this.dioClient, required this.dio});


  Future<UserModel> login({required LoginParams params,}) async {
    var jsonParams = params.toJson();
    late final Response response;
    response = await dio.post(
      AppUrl.login,
      data: jsonParams,
    );
    log('response $response');
    return UserModel.fromJson(response.data);
  }

  Future<ChangePasswordModel> getChangePassword({
    required ChangePasswordParam changePasswordParam,
  }) async {
    late final Response response;
    var jsonParams = changePasswordParam.toJson();
    response = await dioClient.post(
      data: jsonParams,
      url: AppUrl.getChangePassword,
      //query: jsonParams
    );
    print('pass response ======= $response');
    if (response.statusCode == 200) {
      debugPrint(
          'inside of the AppManagerRemote the Response for customer is ==============${response.data}');
    }
    return ChangePasswordModel.fromJson(
      response.data,
    );
  }
}
