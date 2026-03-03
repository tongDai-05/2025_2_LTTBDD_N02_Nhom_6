import 'package:bai_tap_lon_cuoi_ki/Settings/profile.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/Selection_languague.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/about.dart';
import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';
import 'package:flutter/material.dart';

class SettingsIndexPage extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const SettingsIndexPage({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    const primaryBlue = Color(0xFF5DADE2);
    const darkBlue = Color(0xFF1B4F72);
    const lightBlue = Color(0xFFEAF4FB);

    return Scaffold(
      backgroundColor: lightBlue,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        // centerTitle: true,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Image.asset(
              'imgs/icon.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 12),
            Text(
              l10n.setting,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _buildCard(
              context,
              icon: Icons.person_outline,
              title: l10n.viewProfile,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        TrangProfile(),
                  ),
                );
              },
            ),
            _buildCard(
              context,
              icon: Icons.language_outlined,
              title: l10n.settinglag,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        LanguaguesPage(
                          currentLocale:
                              currentLocale,
                          onLocaleChanged:
                              onLocaleChanged,
                        ),
                  ),
                );
              },
            ),
            _buildCard(
              context,
              icon: Icons.info_outline,
              title: l10n.about,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        const AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    const primaryBlue = Color(0xFF5DADE2);
    const darkBlue = Color(0xFF1B4F72);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryBlue.withOpacity(
                  0.15,
                ),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryBlue.withOpacity(
                    0.15,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: primaryBlue,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: darkBlue,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: primaryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
