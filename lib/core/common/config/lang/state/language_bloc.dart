import 'dart:developer';

import 'package:aqaqeer/core/common/config/lang/state/store_current_lang.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../injection/injection.dart';
import '../../../storage/cash_helper.dart';
import '../language.dart';
part 'language_event.dart';
part 'language_state.dart';


class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {

  CashHelper cashHelper = locator.get<CashHelper>();

  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
  }


  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    await locator.get<LanguageStorage>().saveCurrentLang(event.selectedLanguage.value.languageCode);
    log('-----------the lang  change  ${locator.get<LanguageStorage>().getCurrentLang()}---------------');
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
