import 'package:flutter/material.dart';
import 'package:bai_tap_lon_cuoi_ki/Languages/app_localizations.dart';
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
  State<ManHinhChinh> createState() =>
      _ManHinhChinhState();
}

class _ManHinhChinhState
    extends State<ManHinhChinh> {
  late List<CityWeather> _cities;
  int _selectedCityIndex = 0;

  @override
  void initState() {
    super.initState();
    _cities = buildDefaultCities();
  }

  Future<void> _openCityManagement() async {
    final result = await Navigator.of(context)
        .push<CityManagementResult>(
          MaterialPageRoute(
            builder: (_) => CityManagementScreen(
              initialCities: _cities,
              initialSelectedIndex:
                  _selectedCityIndex,
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
        builder: (_) =>
            ChiTietThoiTiet(city: city),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final city = _cities[_selectedCityIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Row(
          children: [
            Image.asset(
              'imgs/icon.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 30),
            Text(
              l10n.appTitle,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _openCityManagement,
            icon: const Icon(
              Icons.location_city_outlined,
            ),
            color: Colors.white,
            tooltip: l10n.cityManager,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () =>
                    _openWeatherDetail(city),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          city.conditionIcon,
                          size: 56,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                city.cityName,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                '${city.tempC}°C • ${conditionLabel(l10n, city.condition)}',
                                style:
                                    const TextStyle(
                                      fontSize:
                                          16,
                                    ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                l10n.detailContent,
                                style:
                                    const TextStyle(
                                      color: Colors
                                          .grey,
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
              const SizedBox(height: 16),
              Text(
                l10n.hourlyForecast,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection:
                      Axis.horizontal,
                  itemCount: city.hourly.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final item =
                        city.hourly[index];
                    return Container(
                      width: 96,
                      padding:
                          const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius:
                            BorderRadius.circular(
                              18,
                            ),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Text(
                            item.timeLabel,
                            style:
                                const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Icon(
                            item.icon,
                            color: Colors.orange,
                            size: 32,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('${item.tempC}°C'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              Text(
                l10n.sevenDayForecast,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: city.daily7.length,
                itemBuilder: (context, index) {
                  final item = city.daily7[index];
                  final dayLabel = intl.DateFormat.E(l10n.localeName).format(
                    DateTime.now().add(Duration(days: index)),
                  );
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(
                          vertical: 6,
                        ),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                            16,
                          ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        item.icon,
                        color: Colors.orange,
                      ),
                      title: Text(
                        dayLabel,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '${item.tempC}°C',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
