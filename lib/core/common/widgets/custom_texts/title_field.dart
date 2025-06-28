import 'package:flutter/material.dart';

import '../../../../../../core/common/config/lang/app_localizations.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';

class TitleField extends StatelessWidget {
 final String text;
   const TitleField({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          (text).tr(context),
          style: CustomTextStyle.titleMedium(
            context,
          ),
          textAlign: TextAlign.start,
        ));
  }
}
