import 'package:aqaqeer/core/provider/app_config_provider.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../../../../resources/assets.gen.dart';

class UserInfoSection extends StatelessWidget {
  final String fullName;

  // final String imageUrl;

  // final List<Notes> userInfoData;

  const UserInfoSection({
    super.key,
    required this.fullName,
    // required this.imageUrl,
    //required this.userInfoData
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(height: 25),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    // bottom: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                Assets.images.aqaqeerLogo.path,
                                // Assets.iconsHomeMainLogo,
                                height: 47,
                                width: 54,
                                fit: BoxFit.fill,
                                //  width: 45,
                              ),
                              Image.asset(
                                Assets.images.aqaqeerText.path,
                                // Assets.iconsHomeMainLogo,
                                height: 50,
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: fullName,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            style: CustomTextStyle.headlineMedium(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        //userInfoData.isNotEmpty
                        visible: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 60,
                              width: getWidthScreen(context) / 1.4,
                              child: ListView.builder(
                                // scrollDirection: Axis.horizontal,
                                //userInfoData.length
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  // final Notes widgetData = userInfoData[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // if(widgetData.url == 'MPR'){
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   RoutesNames.profileScreen,
                                      // );
                                      // }
                                    },
                                    child: Container(
                                      width: getWidthScreen(context),
                                      // margin: EdgeInsets.symmetric(horizontal: 8),

                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          // secureNetworkImage(
                                          //   url:  AppUrl.baseUrl
                                          //       .split('api')
                                          //       .join(widgetData.icon ?? ""),
                                          //   width: 25,
                                          //   height: 25,
                                          // ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: CustomText(
                                              text:
                                                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا  ',
                                              // style: CustomTextStyle.bodySmall(
                                              //   context,
                                              // ),
                                              fontSize: 12,
                                              maxLines: 2,
                                              // softWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: getIt<AppConfigProvider>().isEn() ? Alignment.topLeft : Alignment.topRight,
            child: badges.Badge(
              position: badges.BadgePosition.bottomStart(bottom: 0, start: 0),
              badgeContent: Icon(
                Icons.verified,
                color: AppColors.primaryColor,
                size: 20,
              ),
              badgeStyle: badges.BadgeStyle(badgeColor: AppColors.transparent),
              showBadge: true,
              child: Container(
                width: 74,
                height: 74,
                decoration: BoxDecoration(
                  color: AppColors.primaryGray,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryGray, width: 3),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
