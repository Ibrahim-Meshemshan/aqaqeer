// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';
import 'package:aqaqeer/core/provider/app_config_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../feature/auth/data/data_source/local/local.dart';
import '../../../di/di.dart';
import '../../../injection/injection.dart';
import '../../config/lang/state/store_current_lang.dart';
import '../../constant/strings.dart';
import '../api_service.dart';


class DioClient extends ApiServices {
  final Dio _dio;

  DioClient(this._dio);

  // final token =locator.get<AuthLocal>().getAuthToken();
  @override
  Future<Response> get(
      {required String url,
        dynamic data,
        dynamic params,
        dynamic token}) async {
    _dio.options.headers = {

      'token': token ?? locator.get<AuthLocal>().getAuthToken(),
      // 'userTypeCode': AppStrings.userTypeCode,
      'lang': 'ar', // getIt<AppConfigProvider>().selectedLocal  application/x-www-form-urlencoded

    };
    var response = await _dio.get(url, data: data, queryParameters: params);
    return response;
  }

  @override
  Future<Response> post({
    required String url,
    dynamic data,
    dynamic params,
    dynamic option,
  }) async {
    _dio.options.headers = {
      'lang': AppStrings.langAr,
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      
    };

    return await _dio.post(
      url,
      data: data,
      queryParameters: params,
      options: option,
    );
  }

  @override
  Future<Response> put({required String url}) async {
    var response = await _dio.put(url);
    return response;
  }

  @override
  Future<Response> delete({required String url}) async {
    var response = await _dio.delete(url);
    return response;
  }



  Future<Response> dioPost({required String url, var data, dynamic param, dynamic contentType}) {
    var headers = {
      //'userTypeCode': AppStrings.userTypeCode,
      'lang': locator.get<LanguageStorage>().getCurrentLang(),
      'token': locator.get<AuthLocal>().getAuthToken(),
    };
    return _dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
        contentType: contentType,
      ),
      queryParameters: param,
      data: data,
    );
  }

  Future<Response> dioGet({
    required String url,
  }) {
    var headers = {
      //'userTypeCode': AppStrings.userTypeCode,
      'lang': locator.get<LanguageStorage>().getCurrentLang(),
      'token': locator.get<AuthLocal>().getAuthToken(),
    };
    return _dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
  }

  Future<Response> dioDownload({
    required String url,
    dynamic filePath,
    required Function(String) onProgress,
  }) {
    var headers = {
      //'userTypeCode': AppStrings.userTypeCode,
      'lang': locator.get<LanguageStorage>().getCurrentLang(),
      'token': locator.get<AuthLocal>().getAuthToken(),
    };
    return _dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total == 0) return;
        if (total != -1) {
          onProgress("${(received / total * 100).toStringAsFixed(0)}%");

          log('percentage: ${(received / total * 100).toStringAsFixed(0)}%');
        }
      },
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        // receiveTimeout: Duration(seconds: 0),
        headers: headers,
      ),
    );
  }

  Future<Response> dioUpload({
    required String url,
    var data,
    dynamic param,
  }) {
    var headers = {
      //'userTypeCode': AppStrings.userTypeCode,
      'lang': locator.get<LanguageStorage>().getCurrentLang(),
      'token': locator.get<AuthLocal>().getAuthToken(),
    };

    return _dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
        contentType: 'multipart/form-data',
      ),
      queryParameters: param,
      data: data,
    );
  }
}

