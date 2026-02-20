import 'package:flutter/material.dart';

import '../Languages/app_localizations.dart';
import '../Data/weather_data.dart';

class ChiTietThoiTiet extends StatelessWidget {
  final CityWeather city;

  const ChiTietThoiTiet({
    super.key,
    required this.city,
  });

  Widget _metricTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final metrics = city.metrics;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        title: Text(
          'Chi tiết thời tiết - ${city.cityName}',
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              Card(
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
                              style:
                                  const TextStyle(
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Thông tin chi tiết',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _metricTile(
                icon: Icons.water_drop_outlined,
                label: 'Độ ẩm',
                value:
                    '${metrics.humidityPercent}%',
              ),
              _metricTile(
                icon: Icons.air,
                label: 'Tốc độ gió',
                value:
                    '${metrics.windKmh.toStringAsFixed(1)} km/h',
              ),
              _metricTile(
                icon: Icons.speed,
                label: 'Áp suất khí quyển',
                value:
                    '${metrics.pressureHpa} hPa',
              ),
              _metricTile(
                icon: Icons.wb_sunny_outlined,
                label: 'UV Index',
                value: '${metrics.uvIndex}',
              ),
              _metricTile(
                icon: Icons.thermostat,
                label: 'Feels Like',
                value: '${metrics.feelsLikeC}°C',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
