import 'package:flutter/material.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';

class StaticCenterCard extends StatelessWidget {
  StaticCenterCard({super.key, required this.text,required this.icon});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          width: getWidthScreen(context) / 2.6,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(icon,size: 15,),
                  const SizedBox(width: 5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomText(
                      text: text,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      style: CustomTextStyle.titleMedium(
                        context,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: '5',
                  style: CustomTextStyle.bodyLarge(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
