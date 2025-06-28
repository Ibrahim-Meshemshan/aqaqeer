import 'package:aqaqeer/core/common/config/theme/src/styles.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/feature/home/presentation/ui/screens/home_screen.dart';
import 'package:aqaqeer/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../profile/profile/presentation/ui/screens/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  static List<Widget> _screens = [
    HomeScreen(),
    ServicesScreenWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: _screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.white,
          elevation: 10.0,
          shape: const StadiumBorder(),
          child: Image.asset(
            Assets.images.aqaqeerLogo.path,
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                onTap: () => showCustomModalBottomSheet(context, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.profileIcon,
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(height: 5),
                      CustomText(text: localization.profile_tab,
                          fontSize: 12,
                          style: CustomTextStyle.bodySmall(context,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.45),
            Expanded(
              child: InkWell(
                highlightColor: AppColors.transparent,
                splashColor: AppColors.transparent,
                borderRadius: BorderRadius.circular(12),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServicesScreenWidget(),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.images.categories,
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(height: 5),
                      CustomText(text: localization.services,
                          fontSize: 12,
                          style: CustomTextStyle.bodySmall(context,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showCustomModalBottomSheet(BuildContext context, int index) {
    if (index == 0)
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
  }
}

class ServicesScreenWidget extends StatelessWidget {
  const ServicesScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(text: 'Services Screen'),
      ),
    );
  }
}

