import 'package:flutter/material.dart';
import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';
import 'package:intl/intl.dart';

enum WeatherType { sunny, stormWarning, cloudy }

class ChiTietThoiTiet extends StatelessWidget {
  final String tenTP;
  final String nhietDo;
  final WeatherType weatherType;
  final String doAm;
  final String chiSoUV;
  final String tamNhin;
  final String apSuat;
  final String luongMua;

  const ChiTietThoiTiet({
    super.key,
    required this.tenTP,
    required this.nhietDo,
    required this.weatherType,
    required this.doAm,
    required this.chiSoUV,
    required this.tamNhin,
    required this.apSuat,
    required this.luongMua,
  });

  String getImageByWeather() {
    switch (weatherType) {
      case WeatherType.cloudy:
        return 'imgs/nhieumay.jpg';
      case WeatherType.stormWarning:
        return 'imgs/mua.jpg';
      case WeatherType.sunny:
        return 'imgs/nang.jpg';
    }
  }

  String getWeatherText(AppLocalizations l10n) {
    switch (weatherType) {
      case WeatherType.sunny:
        return l10n.weatherSunny;
      case WeatherType.stormWarning:
        return l10n.weatherStormWarning;
      case WeatherType.cloudy:
        return l10n.weatherCloudy;
    }
  }

  Widget _buildInfoCard(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeName = Localizations.localeOf(context).toString();
    final todayFormatted = DateFormat.yMd(localeName).format(DateTime.now());

    final days7 = List.generate(
      7,
      (index) => DateFormat.E(
        localeName,
      ).format(DateTime.now().add(Duration(days: index))),
    );

    final gio = [
      '0h',
      '2h',
      '4h',
      '6h',
      '8h',
      '10h',
      '12h',
      '14h',
      '16h',
      '18h',
      '20h',
      '22h',
      '0h',
    ];

    final nhietDoTheoGio = [
      '24°C',
      '23°C',
      '22°C',
      '25°C',
      '27°C',
      '30°C',
      '32°C',
      '33°C',
      '32°C',
      '30°C',
      '28°C',
      '26°C',
      '25°C',
    ];

    final iconTheoGio = [
      Icons.nights_stay,
      Icons.nights_stay,
      Icons.nights_stay,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.wb_sunny,
      Icons.cloud,
      Icons.cloud,
      Icons.nights_stay,
      Icons.nights_stay,
    ];

    final nhietDo7Ngay = [
      '32°C',
      '31°C',
      '30°C',
      '29°C',
      '33°C',
      '34°C',
      '32°C',
    ];

    final icon7Ngay = [
      Icons.wb_sunny,
      Icons.cloud,
      Icons.cloud,
      Icons.wb_sunny,
      Icons.thunderstorm,
      Icons.wb_sunny,
      Icons.wb_sunny,
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(l10n.detailTitle(tenTP)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              tenTP,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset(
              getImageByWeather(),
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              l10n.todayWithDate(todayFormatted),
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              nhietDo,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getWeatherText(l10n),
              style: const TextStyle(fontSize: 22, color: Colors.orange),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.hourlyForecast,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: gio.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 90,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          gio[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Icon(
                          iconTheoGio[index],
                          color: Colors.orange,
                          size: 28,
                        ),
                        const SizedBox(height: 4),
                        Text(nhietDoTheoGio[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.sevenDayForecast,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: Icon(icon7Ngay[index], color: Colors.orange),
                    title: Text(
                      days7[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      nhietDo7Ngay[index],
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Text(
              l10n.todayDetailTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildInfoCard(
                    Icons.wb_sunny_outlined,
                    l10n.uvIndex,
                    chiSoUV,
                    Colors.orange,
                  ),
                  _buildInfoCard(
                    Icons.umbrella_outlined,
                    l10n.rainAmount,
                    luongMua,
                    Colors.blue,
                  ),
                  _buildInfoCard(
                    Icons.remove_red_eye_outlined,
                    l10n.visibility,
                    tamNhin,
                    Colors.green,
                  ),
                  _buildInfoCard(
                    Icons.water_drop_outlined,
                    l10n.humidity,
                    doAm,
                    Colors.cyan,
                  ),
                  _buildInfoCard(
                    Icons.speed,
                    l10n.pressure,
                    apSuat,
                    Colors.purple,
                  ),
                  _buildInfoCard(Icons.air, l10n.wind, "12 km/h", Colors.teal),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
