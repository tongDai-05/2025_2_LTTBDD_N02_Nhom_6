import 'package:flutter/material.dart';
import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

import '../City/city_management.dart';
import '../Content/chitietthoitiet.dart';
import '../Data/weather_data.dart';

class ManHinhChinh extends StatefulWidget {
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const ManHinhChinh({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
  });

  @override
  State<ManHinhChinh> createState() => _ManHinhChinhState();
}

class _ManHinhChinhState extends State<ManHinhChinh> {
  late List<CityWeather> _cities;
  int _selectedCityIndex = 0;

  @override
  void initState() {
    super.initState();
    _cities = buildDefaultCities();
  }

  Future<void> _openCityManagement() async {
    final result = await Navigator.of(context).push<CityManagementResult>(
      MaterialPageRoute(
        builder: (_) => CityManagementScreen(
          initialCities: _cities,
          initialSelectedIndex: _selectedCityIndex,
        ),
      ),
    );

    if (result == null) return;
    setState(() {
      _cities = result.cities;
      _selectedCityIndex = result.selectedIndex;
    });
  }

  void _openWeatherDetail(CityWeather city) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChiTietThoiTiet(city: city),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final city = _cities[_selectedCityIndex];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'imgs/icon.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 16),
            Text(
              l10n.appTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _openCityManagement,
            icon: const Icon(Icons.location_city_outlined),
            color: Colors.white70,
            tooltip: l10n.cityManager,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4A90E2), 
              Color(0xFF74B9FF), 
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () => _openWeatherDetail(city),
                    child: Card(
                      color: Colors.white.withOpacity(0.18),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(
                              city.conditionIcon,
                              size: 60,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    city.cityName,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${city.tempC}°C • ${conditionLabel(l10n, city.condition)}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    l10n.detailContent,
                                    style: const TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    l10n.hourlyForecast,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 135,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: city.hourly.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final item = city.hourly[index];
                        return Container(
                          width: 105,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text(
                                item.timeLabel,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Icon(
                                item.icon,
                                color: Colors.white,
                                size: 30,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${item.tempC}°C',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    l10n.sevenDayForecast,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: city.daily7.length,
                    itemBuilder: (context, index) {
                      final item = city.daily7[index];
                      final dayLabel = intl.DateFormat.E(
                              l10n.localeName)
                          .format(DateTime.now()
                              .add(Duration(days: index)));

                      return Card(
                        color: Colors.white.withOpacity(0.18),
                        margin:
                            const EdgeInsets.symmetric(vertical: 6),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: ListTile(
                          leading: Icon(
                            item.icon,
                            color: Colors.white,
                          ),
                          title: Text(
                            dayLabel,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Text(
                            '${item.tempC}°C',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}