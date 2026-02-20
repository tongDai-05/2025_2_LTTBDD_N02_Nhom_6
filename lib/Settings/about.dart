import 'package:flutter/material.dart';

import 'package:bai_tap_lon_cuoi_ki/Languages/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(width: 12),
            Text(
              l10n.about,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                l10n.aboutAppHeadline,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.aboutIntro,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.aboutHighlightsTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.aboutHighlightHome,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                l10n.aboutHighlightForecast,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                l10n.aboutHighlightCityManagement,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                l10n.aboutHighlightWeatherDetail,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                l10n.aboutHighlightSettings,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.aboutDataScopeTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.aboutDataScope,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.aboutFutureTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.aboutFutureBullet1,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
