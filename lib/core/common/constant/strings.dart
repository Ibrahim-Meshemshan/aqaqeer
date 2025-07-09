// ignore_for_file: non_constant_identifier_names

class AppStrings {
  AppStrings._();

  //General
  static const String appName = "Aqaqeer";
  static const String langAr = "ar";
  static const String langEn = "en";
  static const String appVersion = "1.0.0";
  static const String applicationCode = 'MET';
  // static const String userTypeCode = 'Pharmacy'; // todo:   //RAS_USER
  static const String operatingSystem = 'Android'; //RAS_USER
  static const bool isOffline = true; //RAS_USER

  static const String success = "success";
  // error handler
  static const String strBadRequestError = "bad_request_error";
  static const String strNoContent = "no_content";
  static const String strForbiddenError = "forbidden_error";
  static const String strUnauthorizedError = "unauthorized_error";
  static const String strNotFoundError = "not_found_error";
  static const String strConflictError = "conflict_error";
  static const String strInternalServerError = "internal_server_error";
  static const String strUnknownError = "unknown_error";
  static const String strTimeoutError = "timeout_error";
  static const String strDefaultError = "default_error";
  static const String strCacheError = "cache_error";
  static const String strNoInternetError = "no_internet_error";
  static const String strLoginFail = "login_err_msg";
  static const String strTokenFailed = "API:TOKEN_FAILED";
  static const String strConnectionError = "connection error";
  static const String local = "local";

  static const String strPasswordMustChange = "API:PASSWORD_MUST_CHANGED";
  static const String strPasswordNotCorrect = "password_not_correct";
  //shared preference keys

  static String TOKEN_KEY = 'auth_token';
  static String LOGIN_TOKEN_KEY = 'login_token';
  static String FCM_TOKEN_KEY = 'fcmToken';
  static String FULL_NAME_KEY = 'fulName';
  static String PASSWORD_KEY = 'password';
  static String USER_NAME_KEY = 'userName';
  static String ID_KEY = 'userId';
  static String PICTURE_KEY = 'picture';
  static String REMEMBER_TOKEN_KEY = 'rememberToken';
  static String FINGERPRINT_REMEMBER_TOKEN_KEY = 'fingerprintRememberToken';
  static String BASE_URL_KEY = 'https://new.aqaqer.com'; // base_url
  static String LOGO_PATH_KEY = 'logo_path';
  static String CUSTOMER_KEY = 'customer';
  static String CLIENT_CODE_KEY = 'client_code';
  static String LANG_KEY = 'pref_lang';
  static String ERROR_KEY = 'error_key';
}
