import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import 'package:aqaqeer/feature/root/state/app_manager_state/app_manager_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shake/shake.dart';
import '../core/common/config/lang/state/language_bloc.dart';
import '../core/common/config/theme/src/theme.dart';
import '../core/common/config/theme/state/theme_app.dart';
import '../core/common/constant/strings.dart';
import '../core/common/function/show_error_bottomSheet.dart';
import '../core/common/function/show_loading_dialog.dart';
import '../core/injection/injection.dart';
import '../core/l10n/localizations/app_localizationsNew.dart';
import '../core/provider/app_config_provider.dart';
import '../core/routes/routes.dart';
import '../core/routes/routes_generator.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final RouteTracker routeTracker = RouteTracker(); // Create an instance
ScreenshotController screenshotController = ScreenshotController();
bool isBottomSheetShown = false;
Uint8List? _screenshotImage;


class MyApp extends StatefulWidget {
   MyApp({super.key});
  late AppConfigProvider appConfigProvider;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final showOnboarding =  locator.get<AppManagerLocal>().getShowOnboarding() ?? true;
  ShakeDetector? detector;
  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
        shakeThresholdGravity: 1.4,
        onPhoneShake: (_) {
          (locator.get<AppManagerLocal>().getShakePhone()??true) && !isBottomSheetShown == true?  _showGlobalBottomSheet():(){};
        });
  }
  void _showGlobalBottomSheet() async {
    final context = navigatorKey.currentContext;
    if (context != null && mounted) {
      showLoadingDialog(context);
      isBottomSheetShown = true;
      final image = await screenshotController.capture();
      if (image != null) {
        setState(() {
          _screenshotImage = image;
        });
      }
      Navigator.pop(context);
      showErrorBottomSheet(context,screenshotImage: _screenshotImage);
    }
  }
  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    late AppConfigProvider appConfigProvider;
    // show vertical only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),

      /// Simulates how the result of [builder] would render on different
      /// devices.
      child: DevicePreview(
        enabled: false,
        builder:
            (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => LanguageBloc()),
                BlocProvider(
                  create: (context) => locator.get<AppManagerBloc>(),
                ),
              ],
              child: ChangeNotifierProvider(
                create: (_) => ThemeService(),
                child: Builder(
                  builder: (context) {
                    appConfigProvider = Provider.of<AppConfigProvider>(context);
                    return BlocBuilder<LanguageBloc, LanguageState>(
                      builder: (context, state) {
                        return MaterialApp(
                          navigatorKey: navigatorKey,
                          title: AppStrings.appName,
                          theme: AppThemes.lightThemeData,
                          debugShowCheckedModeBanner: false,
                          localizationsDelegates: AppLocalizations.localizationsDelegates,
                          supportedLocales: AppLocalizations.supportedLocales,
                          locale: Locale(appConfigProvider.getLocal()),
                          // locale: Locale(state.selectedLanguage.toString()),

                          onGenerateRoute: RouteGenerator.generateRoutes,
                            // localizationsDelegates: [
                            //   AppLocalizationsOld.delegates,
                            //   GlobalCupertinoLocalizations.delegate,
                            //   GlobalMaterialLocalizations.delegate,
                            //   GlobalWidgetsLocalizations.delegate,
                            //
                            //
                            // ],
                            // supportedLocales: const [
                            //   Locale('en'), //English
                            //   Locale('ar'), //Arabic
                            // ],

                          localeResolutionCallback: (
                            deviceLocale,
                            supportedLocales,
                          ) {
                            for (var locale in supportedLocales) {
                              if (deviceLocale != null &&
                                  deviceLocale.languageCode ==
                                      locale.languageCode) {
                                return deviceLocale;
                              }
                            }
                            return supportedLocales.first;
                          },
                          // routes: Routes.routes,
                          // navigatorObservers: [routeTracker],
                          // Add RouteObserver

                          // initialRoute: Routes.splash,
                          // home: const SplashScreen.SplashScreen(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
      ),
    );
  }
}
