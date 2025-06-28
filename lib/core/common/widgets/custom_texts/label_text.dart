import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../config/theme/src/styles.dart';

Text labelText({required BuildContext context, required String label}) {
  return Text(label.tr(context),
      style: CustomTextStyle.titleMedium(context,
          fontWeight: FontWeight.bold));
}