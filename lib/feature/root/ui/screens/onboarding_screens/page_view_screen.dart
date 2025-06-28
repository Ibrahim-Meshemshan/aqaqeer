import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:aqaqeer/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/onboarding_widgets/onboarding_body.dart';

class OnboardingViewScreen extends StatefulWidget {
  OnboardingViewScreen({super.key});

  @override
  State<OnboardingViewScreen> createState() => _OnboardingViewScreenState();
}

class _OnboardingViewScreenState extends State<OnboardingViewScreen> {
  PageController pageController = PageController(initialPage: 0);
  bool showTemporaryLoader = false;

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<AppManagerBloc>().add(GetOnboardingScreensEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocBuilder<AppManagerBloc, AppManagerState>(
      //   builder: (context, state) {
      //     if (state.onboardingState.isLoading()) {
      //       return Center(
      //         child: LoaderWidget(),
      //       );
      //     }
      //     if (state.onboardingState.isSuccess()) {
      //       final List<OnBoardingScreensModelData> screens =
      //           state.onboardingState.model?.data ?? [];
      //       if (screens.isEmpty && !showTemporaryLoader) {
      //         // إظهار اللودر المؤقت
      //         showTemporaryLoader = true;
      //         Future.delayed(const Duration(seconds: 1), () {
      //           if (mounted) {
      //             setState(() {
      //               showTemporaryLoader = false;
      //             });
      //           }
      //         });
      //
      //         return const Center(child: LoaderWidget());
      //       }
      //       else return PageView.builder(
      //         controller: pageController,
      //         itemCount: screens.length,
      //         itemBuilder: (context, index) {
      //           final screen = screens[index];
      //           final isLastPage = index == screens.length - 1;
      body: OnboardingBody(
        image: Assets.images.pharmacy.path,
        text:
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص هذا النص هو مثال لنص يمكن أن ' ,
        //isLastPage ? "ابدأ الآن" :
        buttonText: AppLocalizations.of(context)!.next,
        onPressed: ()async {
          //async
          // if (isLastPage) {
          // locator.get<AppManagerLocal>().saveShowOnboarding(false);
         await locator.get<SharedPreferences>().setBool('onboarding', true);
          Navigator.pushReplacementNamed(context, RoutesNames.signupScreen);
          // } else {
          //   pageController.nextPage(
          //     duration: const Duration(milliseconds: 700),
          //     curve: Curves.easeIn,
          //   );
          // }
        },
      ),
    );
  }
  // if (state.onboardingState.isFail()) {
  //   return CustomPlaceholder(
  //     message: state.onboardingState.error,);
  // }
  // return Container();
}
