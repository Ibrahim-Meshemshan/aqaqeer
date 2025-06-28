import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../resources/assets.gen.dart';

class FirstOnboardingScreen extends StatefulWidget {
  const FirstOnboardingScreen({super.key});

  @override
  State<FirstOnboardingScreen> createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> with TickerProviderStateMixin {
  // @override
  // void initState() {
  //   context.read<AppManagerBloc>().add(GetAppInfo(clientCode: AppStrings.clientCode));
  //   super.initState();
  // }
  bool _isChecked = false;

  // bool _isInitial = true;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      //state.appInfoState.isLoading() || state.appInfoState.isFail()
      inAsyncCall: false,
      //   color: AppColors.primaryColor.withValues(alpha: 0.6),
      // progressIndicator:  state.appInfoState.isLoading()? CircularProgressIndicator(color: AppColors.white,) : SizedBox(),
      child: Container(
        color: AppColors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: FractionalOffset.center,
                          child: Image.asset(
                            Assets.images.background.path,
                            width: getWidthScreen(context),
                            height: getHeightScreen(context),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            SizedBox(height: 50),
                            Align(
                              alignment: FractionalOffset.center,
                              child: Image.asset(
                                Assets.images.aqaqeerLogo.path,
                                width: 193,
                                height: 167,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset.center,
                              child: Image.asset(
                                Assets.images.aqaqeerText.path,
                                width: 177,
                                height: 59,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: CustomButton(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                width: 370,
                                height: 55,
                                borderRadius: BorderRadius.circular(35),
                                backgroundColor: AppColors.lightPurple,
                                child: Text(
                                  AppLocalizations.of(context)!.start,
                                  style: CustomTextStyle.titleMedium(
                                    context,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesNames.pageViewScreen,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL() async {
  final url = Uri.parse(
    'https://Yourvoice.automata4.app/term-of-use',
  ); // Replace with your actual URL
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
