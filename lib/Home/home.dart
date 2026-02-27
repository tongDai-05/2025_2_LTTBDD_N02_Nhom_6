import 'package:bai_tap_lon_cuoi_ki/Content/chitietthoitiet.dart';
import 'package:flutter/material.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/Selection_languague.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/profile.dart';
import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';

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
  List ds = ['Hà Nội', 'TP.HCM', 'Đà Nẵng'];
  List dsnhietdo = ['32°C', '20°C', '24°C'];
  List dsicon = [Icons.wb_sunny, Icons.thunderstorm, Icons.cloud];
  List dsWeather = [
    WeatherType.sunny,
    WeatherType.stormWarning,
    WeatherType.cloudy,
  ];
  List dsDoAm = ['65%', '80%', '75%'];
  List dsTamNhin = ['10 km', '8 km', '12 km'];
  List dsApSuat = ['1012 hPa', '1008 hPa', '1010 hPa'];
  List dsLuongMua = ['0 mm', '15 mm', '2 mm'];

  String keyword = "";

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    List dsUV = [l10n.low, l10n.medium, l10n.high];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Row(
          children: [
            Image.asset('imgs/icon.png', width: 50, height: 50),
            const SizedBox(width: 30),
            Text(
              l10n.appTitle,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.searchCityHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  keyword = value;
                });
              },
            ),
          ),
          Text(l10n.currentCityCount(ds.length)),
          Expanded(
            child: ListView.builder(
              itemCount: ds.length,
              itemBuilder: (context, index) {
                if (!ds[index].toLowerCase().contains(keyword.toLowerCase())) {
                  return const SizedBox();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChiTietThoiTiet(
                          tenTP: ds[index],
                          nhietDo: dsnhietdo[index],
                          weatherType: dsWeather[index],
                          doAm: dsDoAm[index],
                          chiSoUV: dsUV[index], 
                          tamNhin: dsTamNhin[index],
                          apSuat: dsApSuat[index],
                          luongMua: dsLuongMua[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        dsicon[index],
                        size: 32,
                        color: Colors.orange,
                      ),
                      title: Text(
                        ds[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        dsnhietdo[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List<Map<String, dynamic>> goiyTP = [
            {
              'ten': 'Cần Thơ',
              'nhiet': '28°C',
              'icon': Icons.wb_sunny,
              'type': WeatherType.sunny,
            },
            {
              'ten': 'Hải Phòng',
              'nhiet': '22°C',
              'icon': Icons.cloud,
              'type': WeatherType.cloudy,
            },
            {
              'ten': 'Nha Trang',
              'nhiet': '30°C',
              'icon': Icons.wb_sunny,
              'type': WeatherType.sunny,
            },
            {
              'ten': 'Huế',
              'nhiet': '25°C',
              'icon': Icons.thunderstorm,
              'type': WeatherType.stormWarning,
            },
            {
              'ten': 'Đà Lạt',
              'nhiet': '18°C',
              'icon': Icons.ac_unit,
              'type': WeatherType.sunny,
            },
          ];
          List danhSachChuaCo = goiyTP
              .where((tp) => !ds.contains(tp['ten']))
              .toList();

          showDialog(
            context: context,
            builder: (context) {
              List<int> indexDuocChon = [];
              return StatefulBuilder(
                builder: (context, setDialogState) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text(
                      l10n.addCityTitle,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: danhSachChuaCo.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(l10n.allCitiesAdded),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: danhSachChuaCo.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, i) {
                                final selected = indexDuocChon.contains(i);
                                return CheckboxListTile(
                                  title: Text(danhSachChuaCo[i]['ten']),
                                  secondary: Icon(
                                    danhSachChuaCo[i]['icon'],
                                    color: Colors.orange,
                                  ),
                                  value: selected,
                                  onChanged: (val) {
                                    setDialogState(() {
                                      val == true
                                          ? indexDuocChon.add(i)
                                          : indexDuocChon.remove(i);
                                    });
                                  },
                                );
                              },
                            ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          l10n.cancel,
                          style: TextStyle(color: Colors.grey[600]),
                        ), 
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: indexDuocChon.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  for (int i in indexDuocChon) {
                                    ds.add(danhSachChuaCo[i]['ten']);
                                    dsnhietdo.add(danhSachChuaCo[i]['nhiet']);
                                    dsicon.add(danhSachChuaCo[i]['icon']);
                                    dsWeather.add(danhSachChuaCo[i]['type']);
                                  }
                                });
                                Navigator.pop(context);
                              },
                        child: Text(l10n.confirmAdd),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        backgroundColor: Colors.blue[800],
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          l10n.otherCities,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
