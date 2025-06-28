// core/injection/src/lang_injection.dart
import 'package:aqaqeer/core/common/config/lang/state/store_current_lang.dart';

import '../../common/storage/cash_helper.dart';
import '../injection.dart';

Future<void> langInject() async {
  locator.registerLazySingleton<LanguageStorage>(
    () => LanguageStorage(cashHelper: locator<CashHelper>()),
  );
}
