import 'package:aqaqeer/feature/root/state/app_manager_state/app_manager_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../core/common/config/lang/state/language_bloc.dart';
import '../core/common/config/theme/src/theme.dart';
import '../core/common/config/theme/state/theme_app.dart';
import '../core/common/constant/strings.dart';
import '../core/injection/injection.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final RouteTracker routeTracker = RouteTracker(); // Create an instance

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
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
                    return BlocBuilder<LanguageBloc, LanguageState>(
                      builder: (context, state) {
                        return MaterialApp(
                          navigatorKey: navigatorKey,
                          title: AppStrings.appName,
                          theme: AppThemes.lightThemeData,
                          debugShowCheckedModeBanner: false,
                          //
                          //   locale: Locale(
                          //   locator.get<LanguageStorage>().getCurrentLang() ?? 'en',
                          // ),
                          //   localizationsDelegates: [
                          //     AppLocalizationsOld.delegates,
                          //     GlobalCupertinoLocalizations.delegate,
                          //     GlobalMaterialLocalizations.delegate,
                          //     GlobalWidgetsLocalizations.delegate,
                          //   ],
                          //   supportedLocales: const [
                          //     Locale('en'), //English
                          //     Locale('ar'), //Arabic
                          //   ],
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
