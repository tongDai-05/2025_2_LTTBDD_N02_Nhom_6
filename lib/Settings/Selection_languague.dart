import 'package:bai_tap_lon_cuoi_ki/Home/home.dart';
import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('vi');

  void _setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF5DADE2);
    const textDark = Color(0xFF1B4F72);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: textDark),
          bodyMedium: TextStyle(color: textDark),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: textDark,
          iconColor: textDark,
        ),
      ),
      home: ManHinhChinh(locale: _locale, onLocaleChanged: _setLocale),
    );
  }
}

class LanguaguesPage extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const LanguaguesPage({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const primaryBlue = Color(0xFF5DADE2);
    const textDark = Color(0xFF1B4F72);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          l10n.languageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: textDark),
            title: Text(
              l10n.languageVietnamese,
              style: TextStyle(
                color: currentLocale.languageCode == 'vi'
                    ? primaryBlue
                    : textDark,
                fontWeight: currentLocale.languageCode == 'vi'
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            trailing: currentLocale.languageCode == 'vi'
                ? const Icon(Icons.check_circle, color: primaryBlue)
                : null,
            onTap: () {
              onLocaleChanged(const Locale('vi'));
              Navigator.pop(context);
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.language, color: textDark),
            title: Text(
              l10n.languageEnglish,
              style: TextStyle(
                color: currentLocale.languageCode == 'en'
                    ? primaryBlue
                    : textDark,
                fontWeight: currentLocale.languageCode == 'en'
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            trailing: currentLocale.languageCode == 'en'
                ? const Icon(Icons.check_circle, color: primaryBlue)
                : null,
            onTap: () {
              onLocaleChanged(const Locale('en'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
