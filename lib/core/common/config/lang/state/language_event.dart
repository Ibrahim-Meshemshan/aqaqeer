part of 'language_bloc.dart';

abstract class LanguageEvent  extends Equatable{}

class ChangeLanguage extends LanguageEvent{
  final Language selectedLanguage;
   ChangeLanguage({required this.selectedLanguage});

  @override
  // TODO: implement props
  List<Object?> get props =>[selectedLanguage];
}


