import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';

class IndicatesRequiredFieldWidget extends StatelessWidget {
  const IndicatesRequiredFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            const TextSpan(
              text: '* ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainRed,
                  fontSize: 16)),
            TextSpan(text: ('indicates_required_field').tr(context)),
          ],
        ),
      ),
    );
  }
}
