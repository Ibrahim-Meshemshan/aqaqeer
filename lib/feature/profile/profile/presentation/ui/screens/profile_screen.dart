import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../../../../../resources/assets.gen.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/profile_items.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  List<ProfileItems> items = [];
  int count = 0;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    //TODO: => when use AppLocalizations in initState should use didChangeDependencies()
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    if (!_isInit) {
      items = [
        ProfileItems(
          title: appLocalizations.personal_profile,
          image: Assets.images.aqaqeerProfiles.path,
          onTap: () {
            Navigator.pushNamed(context, RoutesNames.personalProfileScreen);
          },
        ),
        ProfileItems(
          title: appLocalizations.preferences,
          image: Assets.images.setting.path,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesNames.preferencesScreen);
          },
        ),
        ProfileItems(
          title: appLocalizations.barcode,
          image: Assets.images.parCode.path,
          onTap: () {
            Navigator.pushNamed(context, RoutesNames.barCodeScreen);
          },
        ),
        ProfileItems(
          title: appLocalizations.logout,
          image: Assets.images.aqaqeerLogOut.path,
          onTap: () {
            LogoutDialog.show(context);
          },
        ),
      ];
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 0),
      height: getHeightScreen(context) / 2.5,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Badge.count(
                    count: count,
                    isLabelVisible: count != 0,
                    backgroundColor: AppColors.mainRed,
                    alignment: Alignment.topRight,
                    textStyle: TextStyle(fontSize: 12),
                    padding: EdgeInsets.all(2),
                    child: SvgPicture.asset(Assets.icons.notification,height: 25,width: 25,fit: BoxFit.fill,)
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.xmark,
                  color: AppColors.black,
                  size: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getHeightScreen(context) / 3.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length, // Change to your dynamic list length
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: items[index].onTap,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        badges.Badge(
                          position: badges.BadgePosition.custom(
                            end: getWidthScreen(context) / 12,
                            bottom: -50,
                          ),
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: AppColors.transparent,
                          ),
                          badgeContent: Image.asset(items[index].image),
                          child: Container(
                            width: getWidthScreen(context) / 2.5,
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                CustomText(
                                  text: items[index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  // height: 8,
                                  height: getHeightScreen(context) / 16,
                                ),
                              ],
                            ),
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
    );
  }
}
