import 'package:aqaqeer/core/di/di.dart';
import 'package:aqaqeer/core/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/common/config/theme/src/theme.dart';
import 'core/injection/injection.dart';
import 'core/l10n/localizations/app_localizationsNew.dart';
import 'core/routes/routes_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  await configureDependencies();
  runApp(ChangeNotifierProvider(
      create: (context) => getIt<AppConfigProvider>(),
      child:  AqaqeerApp()));
}

class AqaqeerApp extends StatelessWidget {
   AqaqeerApp({super.key});
  late AppConfigProvider appConfigProvider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appConfigProvider.getLocal()),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
      onGenerateRoute: RouteGenerator.generateRoutes,
      // initialRoute: RoutesNames.rootScreenView,
    );
  }
}
