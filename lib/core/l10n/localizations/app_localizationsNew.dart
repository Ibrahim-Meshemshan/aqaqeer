import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizationsNew_ar.dart';
import 'app_localizationsNew_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localizations/app_localizationsNew.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @personal_profile.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get personal_profile;

  /// No description provided for @profile_tab.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get profile_tab;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'preferences'**
  String get preferences;

  /// No description provided for @lang_settings.
  ///
  /// In en, this message translates to:
  /// **'Language setting'**
  String get lang_settings;

  /// No description provided for @app_permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get app_permissions;

  /// No description provided for @allow_media_access.
  ///
  /// In en, this message translates to:
  /// **'Allow media access'**
  String get allow_media_access;

  /// No description provided for @allow_notifications.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications'**
  String get allow_notifications;

  /// No description provided for @no_permissions_required.
  ///
  /// In en, this message translates to:
  /// **'No permissions required'**
  String get no_permissions_required;

  /// No description provided for @permission_granted.
  ///
  /// In en, this message translates to:
  /// **'Permission granted'**
  String get permission_granted;

  /// No description provided for @manage_permissions.
  ///
  /// In en, this message translates to:
  /// **'Manage Permissions'**
  String get manage_permissions;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'barcode'**
  String get barcode;

  /// No description provided for @nationalId.
  ///
  /// In en, this message translates to:
  /// **'national_Id'**
  String get nationalId;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'services'**
  String get services;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'english'**
  String get english;

  /// No description provided for @highlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'logout'**
  String get logout;

  /// No description provided for @are_you_sure_you_want_to_log_out.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get are_you_sure_you_want_to_log_out;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get delete_account;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @are_you_sure_you_want_to_delete_your_account.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?\\n This action cannot be undone.'**
  String get are_you_sure_you_want_to_delete_your_account;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcome_back;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'login'**
  String get login;

  /// No description provided for @user_name.
  ///
  /// In en, this message translates to:
  /// **'user name'**
  String get user_name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Did you forget_password?'**
  String get forget_password;

  /// No description provided for @do_not_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get do_not_have_an_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create account?'**
  String get create_account;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @please_enter_data.
  ///
  /// In en, this message translates to:
  /// **'Please enter data'**
  String get please_enter_data;

  /// No description provided for @activation_code.
  ///
  /// In en, this message translates to:
  /// **'Activation code'**
  String get activation_code;

  /// No description provided for @please_enter_the_activation_code_first.
  ///
  /// In en, this message translates to:
  /// **'Please enter the activation code first'**
  String get please_enter_the_activation_code_first;

  /// No description provided for @please_enter_the_code_sent_to_you_to_activate_your_account.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code sent to you to activate your account'**
  String get please_enter_the_code_sent_to_you_to_activate_your_account;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verification;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get date_of_birth;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @please_enter_first_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter first name'**
  String get please_enter_first_name;

  /// No description provided for @please_enter_last_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter last name'**
  String get please_enter_last_name;

  /// No description provided for @please_enter_date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Please enter date of birth'**
  String get please_enter_date_of_birth;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @confirm_pass_match_validation.
  ///
  /// In en, this message translates to:
  /// **'confirm password match validation'**
  String get confirm_pass_match_validation;

  /// No description provided for @activate_the_account.
  ///
  /// In en, this message translates to:
  /// **'Activate the account'**
  String get activate_the_account;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'previous'**
  String get previous;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'start'**
  String get start;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'requests'**
  String get requests;

  /// No description provided for @field_required.
  ///
  /// In en, this message translates to:
  /// **'field required'**
  String get field_required;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @fail_login.
  ///
  /// In en, this message translates to:
  /// **'Login failed, incorrect data'**
  String get fail_login;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @please_enter_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter mobile number'**
  String get please_enter_mobile_number;

  /// No description provided for @please_enter_valid_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid mobile number'**
  String get please_enter_valid_mobile_number;

  /// No description provided for @fail_confirm.
  ///
  /// In en, this message translates to:
  /// **'Password dose not match'**
  String get fail_confirm;

  /// No description provided for @meddle_name.
  ///
  /// In en, this message translates to:
  /// **'Father Name'**
  String get meddle_name;

  /// No description provided for @no_internet_error.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get no_internet_error;

  /// No description provided for @app_news.
  ///
  /// In en, this message translates to:
  /// **'App News'**
  String get app_news;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
