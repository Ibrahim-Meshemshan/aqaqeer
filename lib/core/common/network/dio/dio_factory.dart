// ignore_for_file: depend_on_referenced_packages, constant_identifier_names
import 'dart:io';
import 'package:aqaqeer/core/common/constant/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constant/src/app_url.dart';
import '../../storage/cash_helper.dart';
import 'dio_interceptor.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "application/x-www-form-urlencoded";
const String ACCEPT = "Accept"; // application/json
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "lang";
// const String USER_TYPE_CODE = "userTypeCode";
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
      AUTHORIZATION: 'def5020094b16b83ea1e8f5d3cbc8a5fd2ad1adbb177ab37fd06a77c52f9f5f7d085ee6662dfc2cfe0ed1e9e723f2d5b3f98c34ff24fed08a05193eab7c70a2c7d91faf1f6a64fd84c121b101e77a9fc338b288e7e2d372e73227924537400dd00ca1d55313f11c0ff234a5d84b799b90c3b2609ba750363df59e5cbebb37d6266f2b4dd36c87ec8598f7b1c5ff47a2b86dd9aecb798e77e46b8fbe1623ac78c0b729a273052ee90c9ddd97e425fc71bcd634a67b1afec173171be6cde6b949f856e8f6d118ea6162ae5e79da8abc79e85f2202879bc7f67379fd78969bc469517a21f6818a84c336f3c09fcca4dc3d20712a2c8ae5e3b38c8e080060309c7eaada6ab7793a0d86ef7d5a5c00f5612605295ca52a75c0a5dabc7cd7ad1a82e6e8389ca7e3a8a3469c3dc9062f142d01fa1bb9bc672d4ac31853da8644997acc17b35cc1ab7224858c82358edd65dec05f6b0bc631132be183297d1133b8adc8697a825',
      DEFAULT_LANGUAGE: 'ar',
      // USER_TYPE_CODE:'Pharmacy',
    };

    dio.options = BaseOptions(
        baseUrl: AppStrings.BASE_URL_KEY,
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