import 'package:flutter/material.dart';

import '../languages/app_localizations.dart';
import '../Data/weather_data.dart';

class CityManagementResult {
  final List<CityWeather> cities;
  final int selectedIndex;

  const CityManagementResult({
    required this.cities,
    required this.selectedIndex,
  });
}

class CityManagementScreen extends StatefulWidget {
  final List<CityWeather> initialCities;
  final int initialSelectedIndex;

  const CityManagementScreen({
    super.key,
    required this.initialCities,
    required this.initialSelectedIndex,
  });

  @override
  State<CityManagementScreen> createState() => _CityManagementScreenState();
}

class _CityManagementScreenState extends State<CityManagementScreen> {
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
    final l10n = AppLocalizations.of(context)!;
    final existing = _cities
        .map((c) => c.cityName.toLowerCase().trim())
        .toSet();

    final available = buildCityCatalog()
        .where((c) => !existing.contains(c.cityName.toLowerCase().trim()))
        .toList();

    if (available.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.cityListFullMessage)));
      return;
    }

    final selectedCity = await showDialog<CityWeather>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(l10n.addCity),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: available.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final city = available[index];
                return ListTile(
                  leading: Icon(city.conditionIcon, color: Colors.orange),
                  title: Text(city.cityName),
                  subtitle: Text('${city.tempC}°C'),
                  onTap: () => Navigator.pop(context, city),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
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
      CityManagementResult(cities: _cities, selectedIndex: _selectedIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        _done();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Text(
            l10n.cityManager,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: _done,
            icon: const Icon(Icons.arrow_back),
            tooltip: l10n.backTooltip,
          ),
          actions: [
            IconButton(
              onPressed: _addCity,
              icon: const Icon(Icons.add),
              tooltip: l10n.addCity,
            ),
            IconButton(
              onPressed: _done,
              icon: const Icon(Icons.check),
              tooltip: l10n.done,
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A90E2), Color(0xFF64B5F6)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: _cities.length,
                itemBuilder: (context, index) {
                  final city = _cities[index];
                  final selected = index == _selectedIndex;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: selected ? const Color(0xFFE3F2FD) : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      leading: Icon(
                        city.conditionIcon,
                        size: 30,
                        color: Colors.orange,
                      ),
                      title: Text(
                        city.cityName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        '${city.tempC}°C',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: Icon(
                        selected ? Icons.check_circle : Icons.circle_outlined,
                        color: selected ? const Color(0xFF4A90E2) : Colors.grey,
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
          ),
        ),
      ),
    );
  }
}
