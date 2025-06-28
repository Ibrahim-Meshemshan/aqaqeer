import 'package:flutter/material.dart';

import '../../../../../../core/common/config/lang/app_localizations.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';

class TitleStepper extends StatelessWidget {
  final String text;
  const TitleStepper({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.center,
        child: Text(
            (text).tr(context),
            style:
            CustomTextStyle.titleLarge(context,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center));
  }
}
