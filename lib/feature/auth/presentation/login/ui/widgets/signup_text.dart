import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.do_not_have_an_account,
          style: CustomTextStyle.titleSmall(context, color: AppColors.mainGray),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesNames.signupScreen);
          },
          child: Text(
            AppLocalizations.of(context)!.create_account,
            style: CustomTextStyle.titleMedium(
              context,
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
