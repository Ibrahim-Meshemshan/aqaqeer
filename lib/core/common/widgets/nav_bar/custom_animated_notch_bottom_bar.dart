import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:aqaqeer/core/common/config/theme/src/colors.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:aqaqeer/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../feature/profile/profile/presentation/ui/screens/profile_screen.dart';
import '../../../../feature/services/presentation/ui/screen/services_screen.dart';
import '../../function/get_width_height_screen.dart';

class CustomAnimatedNotchBottomBar extends StatelessWidget {
  CustomAnimatedNotchBottomBar({super.key});

  bool hadNotification = false;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return AnimatedNotchBottomBar(
      notchBottomBarController: NotchBottomBarController(index: 1),
      color: AppColors.white,
      showLabel: true,
      textOverflow: TextOverflow.ellipsis,
      maxLine: 1,
      shadowElevation: 0,
      kBottomRadius: 0.0,
      circleMargin: 5,
      textAlign: TextAlign.center,
      bottomBarHeight: 70,
      notchColor: AppColors.white,
      removeMargins: true,
      bottomBarWidth: getWidthScreen(context),
      showShadow: false,
      durationInMilliSeconds: 300,
      itemLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0.5,
      bottomBarItems: [
        BottomBarItem(
          inActiveItem: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Assets.images.categories,
              width: 28,
              height: 28,
            ),
          ),
          activeItem: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Assets.images.categories,
              width: 28,
              height: 28,
            ),
          ),
          //'services'.tr(context)
          itemLabel: (localization.services),
        ),
        BottomBarItem(
          inActiveItem: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.images.aqaqeerLogo.path,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          activeItem: Image.asset(
            Assets.images.aqaqeerLogo.path,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ), //.tr(context)
          itemLabel: '',
        ),
        BottomBarItem(
          inActiveItem: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Assets.icons.profileIcon,
              width: 28,
              height: 28,
            ),
          ),
          activeItem: SizedBox(),
          itemLabel: localization.profile_tab,
        ),
      ],
      onTap: (index) {
        if (index == 0) { //servicesScreen
          Navigator.pushNamed(context, RoutesNames.myHomePage);
          index = 1;
        }
        if (index == 2) {
          showModalBottomSheet(
            backgroundColor: AppColors.white,
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: 350,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            context: context,
            builder: (context) {
              return ProfileScreen();
            },
          );
          index = 1;
        }
        index = 1;
      },
      kIconSize: 35.0,
    );
  }
}
