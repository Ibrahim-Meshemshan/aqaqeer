import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:flutter/cupertino.dart';

String? validator(
    {var value,
      required BuildContext context,
      bool? isMobileNum,
      bool? isEmail,
      bool? isPassword,
      bool? isAverage,
      final Function()? confirmPassword}) {
  if (confirmPassword != null && value!.isNotEmpty) {
    return confirmPassword();
  }
  if (value!.isEmpty) {
    return AppLocalizations.of(context)!.field_required;
      //'fields_required'.tr(context);
  }

  if (isMobileNum == true && value.length < 10)  {
    // 11
    return AppLocalizations.of(context)!.field_required;
    //'whatsApp_validation'.tr(context)
  }

  if (isEmail == true &&
      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
    return 'validate_email'.tr(context);
  }
  if (isPassword == true && value.length < 8) {
    return AppLocalizations.of(context)!.field_required;
    // ('password_validation').tr(context);
  }
  if (isAverage == true &&
      (double.parse(value) < 0 || double.parse(value) > 100)) {
    return ('average_validation').tr(context);
  }
  return null;
}