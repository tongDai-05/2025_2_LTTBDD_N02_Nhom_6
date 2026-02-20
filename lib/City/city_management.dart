import 'package:flutter/material.dart';

import '../Data/weather_data.dart';

class CityManagementResult {
  final List<CityWeather> cities;
  final int selectedIndex;

  const CityManagementResult({
    required this.cities,
    required this.selectedIndex,
  });
}

class CityManagementScreen
    extends StatefulWidget {
  final List<CityWeather> initialCities;
  final int initialSelectedIndex;

  const CityManagementScreen({
    super.key,
    required this.initialCities,
    required this.initialSelectedIndex,
  });

  @override
  State<CityManagementScreen> createState() =>
      _CityManagementScreenState();
}

class _CityManagementScreenState
    extends State<CityManagementScreen> {
  late List<CityWeather> _cities;
  late int _selectedIndex;
  bool _returningResult = false;

  @override
  void initState() {
    super.initState();
    _cities = List.of(widget.initialCities);
    _selectedIndex = widget.initialSelectedIndex;
  }

  Future<void> _addCity() async {
    final existing = _cities
        .map(
          (c) => c.cityName.toLowerCase().trim(),
        )
        .toSet();

    final available = buildCityCatalog()
        .where(
          (c) => !existing.contains(
            c.cityName.toLowerCase().trim(),
          ),
        )
        .toList();

    if (available.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Danh sách thành phố đã đầy (không còn thành phố để thêm).',
          ),
        ),
      );
      return;
    }

    final selectedCity =
        await showDialog<CityWeather>(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              title: const Text('Thêm thành phố'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: available.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final city = available[index];
                    return ListTile(
                      leading: Icon(
                        city.conditionIcon,
                        color: Colors.orange,
                      ),
                      title: Text(city.cityName),
                      subtitle: Text(
                        '${city.tempC}°C',
                      ),
                      onTap: () => Navigator.pop(
                        context,
                        city,
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context),
                  child: const Text('Huỷ'),
                ),
              ],
            );
          },
        );

    if (selectedCity == null) return;

    setState(() {
      _cities.add(selectedCity);
      _selectedIndex = _cities.length - 1;
    });
  }

  void _done() {
    if (_returningResult) return;
    _returningResult = true;
    Navigator.pop(
      context,
      CityManagementResult(
        cities: _cities,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        _done();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          foregroundColor: Colors.white,
          title: const Text('Quản lý thành phố'),
          leading: IconButton(
            onPressed: _done,
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Quay lại',
          ),
          actions: [
            IconButton(
              onPressed: _addCity,
              icon: const Icon(Icons.add),
              tooltip: 'Add city',
            ),
            IconButton(
              onPressed: _done,
              icon: const Icon(Icons.check),
              tooltip: 'Done',
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _cities.length,
          itemBuilder: (context, index) {
            final city = _cities[index];
            final selected =
                index == _selectedIndex;

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(
                  city.conditionIcon,
                  color: Colors.orange,
                ),
                title: Text(
                  city.cityName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('${city.tempC}°C'),
                trailing: selected
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                      ),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
