import 'package:flutter/material.dart';
import '../languages/app_localizations.dart';
import '../Data/weather_data.dart';

class ChiTietThoiTiet extends StatelessWidget {
  final CityWeather city;

  const ChiTietThoiTiet({super.key, required this.city});

  Widget _metricTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final metrics = city.metrics;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF4A90E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          l10n.detailPageTitle,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF5DADE2), Color(0xFF74B9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(city.conditionIcon, size: 64, color: Colors.white),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  l10n.detailInfoTitle,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),
                _metricTile(
                  icon: Icons.water_drop_outlined,
                  label: l10n.humidityLabel,
                  value: '${metrics.humidityPercent}%',
                ),
                _metricTile(
                  icon: Icons.air,
                  label: l10n.windSpeedLabel,
                  value: '${metrics.windKmh.toStringAsFixed(1)} km/h',
                ),
                _metricTile(
                  icon: Icons.speed,
                  label: l10n.pressureLabel,
                  value: '${metrics.pressureHpa} hPa',
                ),
                _metricTile(
                  icon: Icons.wb_sunny_outlined,
                  label: l10n.uvIndexLabel,
                  value: '${metrics.uvIndex}',
                ),
                _metricTile(
                  icon: Icons.thermostat,
                  label: l10n.feelsLikeLabel,
                  value: '${metrics.feelsLikeC}°C',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
