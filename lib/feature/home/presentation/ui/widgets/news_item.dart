import 'package:flutter/material.dart';

import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';

class NewsItem extends StatelessWidget {
   NewsItem({super.key,required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: getWidthScreen(context),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: CustomText(text: title, color: Colors.white),
      );
    }
  }

