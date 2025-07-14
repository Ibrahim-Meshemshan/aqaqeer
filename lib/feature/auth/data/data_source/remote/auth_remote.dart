import 'dart:developer';
import 'package:aqaqeer/feature/auth/domain/entities/signup_params.dart';
import 'package:dio/dio.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/network/dio/dio_client.dart';
import '../../../domain/entities/login_params.dart';
import '../../models/signup_model.dart';
import '../../models/user_model.dart';


class AuthRemote {
  DioClient dioClient;
  final Dio dio;

  AuthRemote({required this.dioClient, required this.dio});

  Future<UserModel> login({required LoginParams login})async {
    var jsonParams = login.toJson();
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.login,
      data: jsonParams,
    );
    log('response $response');
    return UserModel.fromJson(response.data);
  }

  Future<SignupModel> signUp({required SignupParams signup})async {
    var jsonParams = signup.toJson();
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.signup,
      data: jsonParams,
    );

    return SignupModel.fromJson(response.data);
  }
}
