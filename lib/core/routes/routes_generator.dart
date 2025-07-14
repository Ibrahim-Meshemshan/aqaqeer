import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:aqaqeer/feature/auth/presentation/login/ui/screens/login.dart';
import 'package:aqaqeer/feature/auth/presentation/sign_up/presentation/state/cubit/signup_provider_cubit.dart';
import 'package:aqaqeer/feature/home/presentation/ui/screens/app_news_screen.dart';
import 'package:aqaqeer/feature/home/presentation/ui/screens/news_detail_screen.dart';
import 'package:aqaqeer/feature/home/presentation/ui/screens/app_news_new.dart';
import 'package:aqaqeer/feature/profile/profile/presentation/ui/screens/barcode_screen.dart';
import 'package:aqaqeer/feature/profile/profile/presentation/ui/screens/personal_profile_screen.dart';
import 'package:aqaqeer/feature/profile/profile/presentation/ui/screens/privacy_policy_screen.dart';
import 'package:aqaqeer/feature/profile/profile/presentation/ui/screens/profile_screen.dart';
import 'package:aqaqeer/feature/root/ui/screens/onboarding_screens/first_onboarding_screen.dart';
import 'package:aqaqeer/feature/root/ui/screens/root_screen.dart';
import 'package:aqaqeer/feature/root/ui/screens/splash_screen.dart';
import 'package:aqaqeer/feature/services/presentation/ui/screen/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/presentation/sign_up/presentation/ui/screens/OTP_screen.dart';
import '../../feature/auth/presentation/sign_up/presentation/ui/screens/sign_up_screen.dart';
import '../../feature/auth/presentation/sign_up/presentation/ui/screens/view_screen.dart';
import '../../feature/auth/presentation/sign_up/presentation/ui/widgets/second_step_signUp_form.dart';
import '../../feature/auth/presentation/sign_up/presentation/ui/widgets/third_step_signUp_form.dart';
import '../../feature/home/presentation/state/home_bloc.dart';
import '../../feature/home/presentation/ui/screens/home_screen.dart';
import '../../feature/profile/profile/presentation/ui/screens/preferences_screen.dart';
import '../../feature/root/ui/screens/onboarding_screens/page_view_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesNames.firstOnboardingScreen:
        return MaterialPageRoute(builder: (context) => FirstOnboardingScreen());
      case RoutesNames.pageViewScreen:
        return MaterialPageRoute(builder: (context) => OnboardingViewScreen());
      case RoutesNames.signupScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => SignupProviderCubit(),
              child: SignUpScreen(),
            ));
      case RoutesNames.secondStepSignUpForm:
        return MaterialPageRoute(builder: (context) => SecondStepSignUpForm());
      case RoutesNames.thirdStepSignUpForm:
        return MaterialPageRoute(builder: (context) => ThirdStepSignupForm());
      case RoutesNames.viewScreen:
        return MaterialPageRoute(builder: (context) => ViewScreen());
      case RoutesNames.oTPScreen:
        return MaterialPageRoute(builder: (context) => OTPScreen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesNames.rootScreenView:
        return MaterialPageRoute(builder: (context) => RootScreenView());
      case RoutesNames.homeBodyScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

    // case RoutesNames.servicesScreen:
    //   return MaterialPageRoute(builder: (context) => ServicesScreen());
      case RoutesNames.bodyProfileContact:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case RoutesNames.privacyScreen:
        return MaterialPageRoute(builder: (context) => PrivacyPolicyScreen());
      case RoutesNames.personalProfileScreen:
        return MaterialPageRoute(builder: (context) => PersonalProfileScreen());
      case RoutesNames.barCodeScreen:
        return MaterialPageRoute(builder: (context) => BarcodeScreen());
      case RoutesNames.preferencesScreen:
        return MaterialPageRoute(builder: (context) => PreferencesScreen());
      case RoutesNames.myHomePage:
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case RoutesNames.appNewsScreen:
        return MaterialPageRoute(builder: (context) => AppNewsScreen());
      // case RoutesNames.newsScreen:
      //   return MaterialPageRoute(builder: (context) => AppNewsScreenNew());


      default:
        return MaterialPageRoute(
          builder:
              (context) =>
              Scaffold(body: Center(child: Text('No Route Found'))),
          settings: settings,
        );
    }
  }
}
