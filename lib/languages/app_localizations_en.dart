// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World';

  @override
  String get setting => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get appTitle => 'Weather';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageVietnamese => 'Vietnamese';

  @override
  String get searchCityHint => 'Search city...';

  @override
  String currentCityCount(int count) {
    return 'Current cities: $count';
  }

  @override
  String get home => 'Home';

  @override
  String get viewProfile => 'View Profile';

  @override
  String get settinglag => 'Language';

  @override
  String get about => 'About';

  @override
  String get cityManager => 'City Manager';

  @override
  String get backTooltip => 'Back';

  @override
  String get addCity => 'Add city';

  @override
  String get done => 'Done';

  @override
  String get cancel => 'Cancel';

  @override
  String get cityListFullMessage =>
      'The city list is full (no more cities to add).';

  @override
  String get detailContent => 'Tap to view details';

  @override
  String get hourlyForecast => 'Hourly Forecast';

  @override
  String get sevenDayForecast => '7-Day Forecast';

  @override
  String detailTitle(String city) {
    return 'Details $city';
  }

  @override
  String todayWithDate(String date) {
    return 'Today, $date';
  }

  @override
  String get developersTitle => 'Development team';

  @override
  String get aboutAppHeadline =>
      'Weather App (Demo) — A course project weather app';

  @override
  String get aboutIntro =>
      'This app is built to simulate a modern mobile weather-viewing experience, while demonstrating core Flutter techniques such as multi-screen navigation (Navigator), state management with setState, building UI with Material Design, and organizing code by feature modules.';

  @override
  String get aboutHighlightsTitle => 'Highlights';

  @override
  String get aboutHighlightHome =>
      '• Home Screen: shows the current city, temperature, weather condition, and an illustrative icon.';

  @override
  String get aboutHighlightForecast =>
      '• Forecast: includes an hourly forecast (horizontal list) and a 7-day forecast (vertical list) to help users see the trend.';

  @override
  String get aboutHighlightCityManagement =>
      '• City Management: manages a sample city list (can add a city via a “fake form”), and selects a city to update what’s shown on Home.';

  @override
  String get aboutHighlightWeatherDetail =>
      '• Weather Detail: shows detailed metrics such as humidity, wind speed, pressure, UV Index, and feels-like temperature.';

  @override
  String get aboutHighlightSettings =>
      '• Settings: supports language switching and viewing member info in a modal (split layout: photo on the left, details on the right).';

  @override
  String get aboutDataScopeTitle => 'Data & scope';

  @override
  String get aboutDataScope =>
      'Within the scope of this assignment, weather data is hard-coded (a fixed list in Dart) to focus on UI, navigation flow, and user experience. The data model is separated so it can later be replaced with a real API (OpenWeather, WeatherAPI, …) without major UI changes.';

  @override
  String get aboutFutureTitle => 'Future work';

  @override
  String get aboutFutureBullet1 =>
      '• Integrate a real-time weather API and cache data.';

  @override
  String get detailPageTitle => 'Details';

  @override
  String get detailInfoTitle => 'Detailed information';

  @override
  String get humidityLabel => 'Humidity';

  @override
  String get windSpeedLabel => 'Wind speed';

  @override
  String get pressureLabel => 'Atmospheric pressure';

  @override
  String get uvIndexLabel => 'UV Index';

  @override
  String get feelsLikeLabel => 'Feels like';

  @override
  String studentIdLabel(String id) {
    return 'Student ID: $id';
  }

  @override
  String dateOfBirthLabel(String date) {
    return 'Date of birth: $date';
  }

  @override
  String classLabel(String name) {
    return 'Class: $name';
  }

  @override
  String hobbiesLabel(String hobbies) {
    return 'Hobbies: $hobbies';
  }

  @override
  String get developerHobbies1 => 'Programming, reading, football, travel';

  @override
  String get developerHobbies2 =>
      'Programming, listening to music, badminton, football';

  @override
  String get close => 'Close';

  @override
  String get weatherSunny => 'Sunny';

  @override
  String get weatherRainy => 'Rainy';

  @override
  String get weatherCloudy => 'Cloudy';

  @override
  String get weatherStormWarning => 'Rainy, thunderstorm warning';
}
