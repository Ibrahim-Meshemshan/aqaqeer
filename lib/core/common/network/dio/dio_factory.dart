// ignore_for_file: depend_on_referenced_packages, constant_identifier_names
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constant/src/app_url.dart';
import '../../storage/cash_helper.dart';
import 'dio_interceptor.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "lang";
const String USER_TYPE_CODE = "userTypeCode";
const String TOKEN = "token";

class DioFactory {
CashHelper cashHelper;
  DioFactory({required this.cashHelper});

  Future<Dio> getDio() async {
    Dio dio = Dio();
    dio.interceptors.add(DioInterceptor(dio));

    // String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: '',
      DEFAULT_LANGUAGE: 'en',
      USER_TYPE_CODE:'RAS_USER',
    };

    dio.options = BaseOptions(
        baseUrl: AppUrl.baseUrl,
        headers: headers,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
         responseBody: false,
        error: true
      ));
    }
    // if(!kIsWeb){
    //   dio.httpClientAdapter=IOHttpClientAdapter(
    //       createHttpClient: ()
    //       {
    //         final HttpClient client = HttpClient();
    //         // You can test the intermediate / root cert here. We just ignore it.
    //         client.badCertificateCallback = (cert, host, port) => true;
    //         return client;
    //       }
    //
    //   );
    // }

    return dio;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}