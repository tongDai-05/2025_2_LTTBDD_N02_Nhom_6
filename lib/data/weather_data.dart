import 'package:flutter/material.dart';

enum WeatherCondition { sunny, rainy, cloudy }

class HourlyForecast {
  final String timeLabel;
  final int tempC;
  final IconData icon;

  const HourlyForecast({
    required this.timeLabel,
    required this.tempC,
    required this.icon,
  });
}

class DailyForecast {
  final String dayLabel;
  final int tempC;
  final IconData icon;

  const DailyForecast({
    required this.dayLabel,
    required this.tempC,
    required this.icon,
  });
}

class WeatherMetrics {
  final int humidityPercent;
  final double windKmh;
  final int pressureHpa;
  final int uvIndex;
  final int feelsLikeC;

  const WeatherMetrics({
    required this.humidityPercent,
    required this.windKmh,
    required this.pressureHpa,
    required this.uvIndex,
    required this.feelsLikeC,
  });
}

class CityWeather {
  final String cityName;
  final int tempC;
  final WeatherCondition condition;
  final IconData conditionIcon;
  final List<HourlyForecast> hourly;
  final List<DailyForecast> daily7;
  final WeatherMetrics metrics;

  const CityWeather({
    required this.cityName,
    required this.tempC,
    required this.condition,
    required this.conditionIcon,
    required this.hourly,
    required this.daily7,
    required this.metrics,
  });
}

String conditionLabel(
  WeatherCondition condition,
) {
  switch (condition) {
    case WeatherCondition.sunny:
      return 'Sunny';
    case WeatherCondition.rainy:
      return 'Rainy';
    case WeatherCondition.cloudy:
      return 'Cloudy';
  }
}

CityWeather _templateCityWeather({
  required String cityName,
  required int tempC,
  required WeatherCondition condition,
}) {
  final icon = switch (condition) {
    WeatherCondition.sunny => Icons.wb_sunny,
    WeatherCondition.rainy => Icons.thunderstorm,
    WeatherCondition.cloudy => Icons.cloud,
  };

  return CityWeather(
    cityName: cityName,
    tempC: tempC,
    condition: condition,
    conditionIcon: icon,
    hourly: const [
      HourlyForecast(
        timeLabel: '06:00',
        tempC: 24,
        icon: Icons.wb_sunny,
      ),
      HourlyForecast(
        timeLabel: '09:00',
        tempC: 27,
        icon: Icons.wb_sunny,
      ),
      HourlyForecast(
        timeLabel: '12:00',
        tempC: 31,
        icon: Icons.wb_sunny,
      ),
      HourlyForecast(
        timeLabel: '15:00',
        tempC: 32,
        icon: Icons.cloud,
      ),
      HourlyForecast(
        timeLabel: '18:00',
        tempC: 29,
        icon: Icons.cloud,
      ),
      HourlyForecast(
        timeLabel: '21:00',
        tempC: 26,
        icon: Icons.nights_stay,
      ),
    ],
    daily7: const [
      DailyForecast(
        dayLabel: 'Mon',
        tempC: 32,
        icon: Icons.wb_sunny,
      ),
      DailyForecast(
        dayLabel: 'Tue',
        tempC: 31,
        icon: Icons.cloud,
      ),
      DailyForecast(
        dayLabel: 'Wed',
        tempC: 30,
        icon: Icons.cloud,
      ),
      DailyForecast(
        dayLabel: 'Thu',
        tempC: 29,
        icon: Icons.wb_sunny,
      ),
      DailyForecast(
        dayLabel: 'Fri',
        tempC: 33,
        icon: Icons.thunderstorm,
      ),
      DailyForecast(
        dayLabel: 'Sat',
        tempC: 34,
        icon: Icons.wb_sunny,
      ),
      DailyForecast(
        dayLabel: 'Sun',
        tempC: 32,
        icon: Icons.wb_sunny,
      ),
    ],
    metrics: const WeatherMetrics(
      humidityPercent: 68,
      windKmh: 12.5,
      pressureHpa: 1012,
      uvIndex: 6,
      feelsLikeC: 34,
    ),
  );
}

List<CityWeather> buildDefaultCities() {
  return [
    _templateCityWeather(
      cityName: 'Hà Nội',
      tempC: 32,
      condition: WeatherCondition.sunny,
    ),
    _templateCityWeather(
      cityName: 'TP.HCM',
      tempC: 29,
      condition: WeatherCondition.rainy,
    ),
    _templateCityWeather(
      cityName: 'Ninh Bình',
      tempC: 28,
      condition: WeatherCondition.cloudy,
    ),
    _templateCityWeather(
      cityName: 'Seoul',
      tempC: 4,
      condition: WeatherCondition.cloudy,
    ),
    _templateCityWeather(
      cityName: 'Tokyo',
      tempC: 7,
      condition: WeatherCondition.sunny,
    ),
  ];
}

List<CityWeather> buildCityCatalog() {
  // Hardcoded catalog used by the City Management screen when adding new cities.
  // Keep this separate from buildDefaultCities() so the home screen can start
  // with a smaller curated list.
  return [
    ...buildDefaultCities(),
    _templateCityWeather(
      cityName: 'Đà Nẵng',
      tempC: 30,
      condition: WeatherCondition.sunny,
    ),
    _templateCityWeather(
      cityName: 'Hải Phòng',
      tempC: 27,
      condition: WeatherCondition.cloudy,
    ),
    _templateCityWeather(
      cityName: 'Huế',
      tempC: 26,
      condition: WeatherCondition.rainy,
    ),
    _templateCityWeather(
      cityName: 'Paris',
      tempC: 12,
      condition: WeatherCondition.cloudy,
    ),
    _templateCityWeather(
      cityName: 'London',
      tempC: 9,
      condition: WeatherCondition.rainy,
    ),
    _templateCityWeather(
      cityName: 'New York',
      tempC: 6,
      condition: WeatherCondition.sunny,
    ),
  ];
}

CityWeather buildNewCityFromName(
  String cityName,
) {
  // Fake form: create a new city with default hardcoded data.
  return _templateCityWeather(
    cityName: cityName,
    tempC: 25,
    condition: WeatherCondition.cloudy,
  );
}
