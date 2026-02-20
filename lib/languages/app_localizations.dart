import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Languages/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World'**
  String get helloWorld;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get appTitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get languageVietnamese;

  /// No description provided for @searchCityHint.
  ///
  /// In en, this message translates to:
  /// **'Search city...'**
  String get searchCityHint;

  /// No description provided for @currentCityCount.
  ///
  /// In en, this message translates to:
  /// **'Current cities: {count}'**
  String currentCityCount(int count);

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfile;

  /// No description provided for @settinglag.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settinglag;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @cityManager.
  ///
  /// In en, this message translates to:
  /// **'City Manager'**
  String get cityManager;

  /// No description provided for @detailContent.
  ///
  /// In en, this message translates to:
  /// **'Tap to view details'**
  String get detailContent;

  /// No description provided for @hourlyForecast.
  ///
  /// In en, this message translates to:
  /// **'Hourly Forecast'**
  String get hourlyForecast;

  /// No description provided for @sevenDayForecast.
  ///
  /// In en, this message translates to:
  /// **'7-Day Forecast'**
  String get sevenDayForecast;

  /// No description provided for @detailTitle.
  ///
  /// In en, this message translates to:
  /// **'Details {city}'**
  String detailTitle(String city);

  /// No description provided for @todayWithDate.
  ///
  /// In en, this message translates to:
  /// **'Today, {date}'**
  String todayWithDate(String date);

  /// No description provided for @developersTitle.
  ///
  /// In en, this message translates to:
  /// **'Development team'**
  String get developersTitle;

  /// No description provided for @aboutAppHeadline.
  ///
  /// In en, this message translates to:
  /// **'Weather App (Demo) — A course project weather app'**
  String get aboutAppHeadline;

  /// No description provided for @aboutIntro.
  ///
  /// In en, this message translates to:
  /// **'This app is built to simulate a modern mobile weather-viewing experience, while demonstrating core Flutter techniques such as multi-screen navigation (Navigator), state management with setState, building UI with Material Design, and organizing code by feature modules.'**
  String get aboutIntro;

  /// No description provided for @aboutHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get aboutHighlightsTitle;

  /// No description provided for @aboutHighlightHome.
  ///
  /// In en, this message translates to:
  /// **'• Home Screen: shows the current city, temperature, weather condition, and an illustrative icon.'**
  String get aboutHighlightHome;

  /// No description provided for @aboutHighlightForecast.
  ///
  /// In en, this message translates to:
  /// **'• Forecast: includes an hourly forecast (horizontal list) and a 7-day forecast (vertical list) to help users see the trend.'**
  String get aboutHighlightForecast;

  /// No description provided for @aboutHighlightCityManagement.
  ///
  /// In en, this message translates to:
  /// **'• City Management: manages a sample city list (can add a city via a “fake form”), and selects a city to update what’s shown on Home.'**
  String get aboutHighlightCityManagement;

  /// No description provided for @aboutHighlightWeatherDetail.
  ///
  /// In en, this message translates to:
  /// **'• Weather Detail: shows detailed metrics such as humidity, wind speed, pressure, UV Index, and feels-like temperature.'**
  String get aboutHighlightWeatherDetail;

  /// No description provided for @aboutHighlightSettings.
  ///
  /// In en, this message translates to:
  /// **'• Settings: supports language switching and viewing member info in a modal (split layout: photo on the left, details on the right).'**
  String get aboutHighlightSettings;

  /// No description provided for @aboutDataScopeTitle.
  ///
  /// In en, this message translates to:
  /// **'Data & scope'**
  String get aboutDataScopeTitle;

  /// No description provided for @aboutDataScope.
  ///
  /// In en, this message translates to:
  /// **'Within the scope of this assignment, weather data is hard-coded (a fixed list in Dart) to focus on UI, navigation flow, and user experience. The data model is separated so it can later be replaced with a real API (OpenWeather, WeatherAPI, …) without major UI changes.'**
  String get aboutDataScope;

  /// No description provided for @aboutFutureTitle.
  ///
  /// In en, this message translates to:
  /// **'Future work'**
  String get aboutFutureTitle;

  /// No description provided for @aboutFutureBullet1.
  ///
  /// In en, this message translates to:
  /// **'• Integrate a real-time weather API and cache data.'**
  String get aboutFutureBullet1;

  /// No description provided for @detailPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailPageTitle;

  /// No description provided for @detailInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Detailed information'**
  String get detailInfoTitle;

  /// No description provided for @humidityLabel.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidityLabel;

  /// No description provided for @windSpeedLabel.
  ///
  /// In en, this message translates to:
  /// **'Wind speed'**
  String get windSpeedLabel;

  /// No description provided for @pressureLabel.
  ///
  /// In en, this message translates to:
  /// **'Atmospheric pressure'**
  String get pressureLabel;

  /// No description provided for @uvIndexLabel.
  ///
  /// In en, this message translates to:
  /// **'UV Index'**
  String get uvIndexLabel;

  /// No description provided for @feelsLikeLabel.
  ///
  /// In en, this message translates to:
  /// **'Feels like'**
  String get feelsLikeLabel;

  /// No description provided for @studentIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Student ID: {id}'**
  String studentIdLabel(String id);

  /// No description provided for @weatherSunny.
  ///
  /// In en, this message translates to:
  /// **'Sunny'**
  String get weatherSunny;

  /// No description provided for @weatherRainy.
  ///
  /// In en, this message translates to:
  /// **'Rainy'**
  String get weatherRainy;

  /// No description provided for @weatherCloudy.
  ///
  /// In en, this message translates to:
  /// **'Cloudy'**
  String get weatherCloudy;

  /// No description provided for @weatherStormWarning.
  ///
  /// In en, this message translates to:
  /// **'Rainy, thunderstorm warning'**
  String get weatherStormWarning;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
