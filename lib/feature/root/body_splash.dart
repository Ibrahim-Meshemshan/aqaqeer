import 'package:animate_do/animate_do.dart';
import 'package:aqaqeer/core/common/function/configuration_splash_screen.dart';
import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/common/config/theme/src/colors.dart';
import '../../resources/assets.gen.dart';

class BodySplash extends StatefulWidget {
  const BodySplash({super.key});

  @override
  State<BodySplash> createState() => _BodySplashState();
}

class _BodySplashState extends State<BodySplash> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () async{
      final onboarding = await  locator.get<SharedPreferences>().getBool('onboarding') ?? false;
      if(onboarding){
        Navigator.pushReplacementNamed(context, RoutesNames.signupScreen);
      }else
        Navigator.pushReplacementNamed(context,RoutesNames.firstOnboardingScreen);
      },
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      // resizeToAvoidBottomInset: false, // Prevent widgets from getting too close when keyboard is open
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Image.asset(Assets.images.background.path),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: FractionalOffset.center,
                        child: FadeInDownBig(
                          duration: const Duration(milliseconds: 1000),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              Assets.images.aqaqeerLogo.path,
                              width: 240,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: FadeInDownBig(
                          duration: const Duration(milliseconds: 1000),
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              Assets.images.aqaqeerText.path,
                              width: 240,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FadeInUpBig(
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          width: 200,
                          child: Image.asset(
                            Assets.icons.automataIntro.path,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Positioned(
                  //   child: Align(
                  //     alignment: Alignment.topRight,
                  //     child: FadeInUpBig(
                  //       duration: const Duration(milliseconds: 500),
                  //       child: SizedBox(
                  //         width: 300,
                  //         child: SvgPicture.asset(
                  //           Assets.images.background.path,
                  //           width: 300,
                  //           fit: BoxFit.fill,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   child: Align(
                  //     alignment: Alignment.bottomLeft,
                  //     child: FadeInUpBig(
                  //       duration: const Duration(milliseconds: 500),
                  //       child: SizedBox(
                  //         width: 300,
                  //         child: SvgPicture.asset(
                  //           Assets.images.background.path,
                  //           fit: BoxFit.fill,
                  //           width: 300,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
