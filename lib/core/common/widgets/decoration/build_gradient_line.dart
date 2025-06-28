
import 'package:flutter/material.dart';

import '../../../injection/injection.dart';
import '../../config/lang/state/store_current_lang.dart';
import '../../config/theme/src/colors.dart';

class GradientLine extends StatelessWidget {
  const GradientLine({super.key});

  @override
  Widget build(BuildContext context) {
    print('the lang is ${locator.get<LanguageStorage>().getCurrentLang()}');
    String? lang= locator.get<LanguageStorage>().getCurrentLang() ?? 'ar';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 2,
          decoration:   BoxDecoration(
              gradient: LinearGradient(
                  colors: const [
                    AppColors.black,
                    AppColors.primaryGray
                  ],
                  begin: lang =='ar'?Alignment.centerLeft:Alignment.bottomRight,
                  end:lang =='ar'? Alignment.bottomRight:Alignment.centerLeft)),
        ),
        Container(
          width: 100,
          height: 2,
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  colors: const [
                    AppColors.black,
                    AppColors.primaryGray
                  ],
                  begin: lang =='ar'?Alignment.bottomRight:Alignment.centerLeft,
                  end:lang =='ar'? Alignment.centerLeft :Alignment. centerRight)),
        ),
      ],
    );
  }
}
