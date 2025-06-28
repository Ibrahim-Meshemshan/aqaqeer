import 'package:aqaqeer/core/common/config/theme/src/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../resources/assets.gen.dart';
import '../../../../auth/presentation/login/ui/widgets/smile_shape_clipper.dart';

class OnboardingBody extends StatelessWidget {
  final String image;
  final String text;
  final String buttonText;
  final void Function() onPressed;

  const OnboardingBody({
    super.key,
    required this.image,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGreen,
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          width: getWidthScreen(context),
          height: getHeightScreen(context),
          child: Stack(
            children: [
              Image.asset(Assets.images.background.path),
              Column(
                children: [
                  ClipPath(
                    clipper: SmileShapeClipper(),
                    child: Container(
                      height: getHeightScreen(context) / 1.6,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(color: AppColors.darkGreen),
                      child: ClipPath(
                        clipper: SmileShapeClipper(),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            // border: Border.all(color:AppColors.mainRed,width: 2),
                          ),
                          // height: getHeightScreen(context)*0.6,
                          //   width: getWidthScreen(context),
                          child: Image.network(
                            fit: BoxFit.cover,
                            AppUrl.baseUrl.split('api').join(image),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Image.asset(
                                Assets.images.aqaqeerLogo.path,
                                // loading placeholder
                                width: getWidthScreen(context),
                                fit: BoxFit.fitHeight,
                              );
                            },
                            errorBuilder:
                                (context, error, stackTrace) => Image.asset(
                                  Assets.images.pharmacy.path,
                                  // Fallback image
                                  width: getWidthScreen(context),
                                  // height: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 18,
                    ),
                    child:
                    // AnimatedTextKit(animatedTexts: [
                    //   TyperAnimatedText(text, textStyle: TextStyle(fontSize: 15,color: AppColors.white, decorationThickness: 0,),
                    //     //  maxLines: 20,
                    //       textAlign: TextAlign.center,speed: Duration(milliseconds: 5)),
                    // ],
                    //   isRepeatingAnimation: false,
                    //   displayFullTextOnTap: true,
                    //   repeatForever: false,),
                    CustomText(
                      text: text,
                      color: AppColors.black,
                      fontSize: 20,
                      maxLines: 20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),

                  Container(
                    width: getWidthScreen(context),
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: CustomButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonText,
                            style: CustomTextStyle.titleMedium(
                              context,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35),
                      text: buttonText,
                      height: 55,
                      width: 370,
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: AppColors.lightPurple,
                      onPressed: onPressed,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
