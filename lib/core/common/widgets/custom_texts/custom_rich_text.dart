import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';


class CustomRichText extends StatelessWidget {
  final String? boldText;
  final String? text;
  const CustomRichText({super.key, this.text, this.boldText});

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          TextSpan(
            text:boldText?? 'Automata4 Group ',
            style: CustomTextStyle.titleSmall(context,
                color: AppColors.black,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: text,
            style: CustomTextStyle.titleSmall(context,
              color: AppColors.gray, ),
          ),
        ],
      ),
    );
  }
}
