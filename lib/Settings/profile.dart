import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:
          AppLocalizations.localizationsDelegates,
      supportedLocales:
          AppLocalizations.supportedLocales,
      home: TrangProfile(),
    ),
  );
}

class TrangProfile extends StatelessWidget {
  TrangProfile({super.key});
  final List<String> avt = [
    'imgs/avt1.jpg',
    'imgs/avt2.jpg',
  ];
  final List<String> ten = [
    'Tống Sỹ Đại',
    'Nguyễn Tiến Dũng',
  ];
  final List<String> msv = [
    '23010037',
    '23010086',
  ];
  final List<String> ngaySinh = [
    '01/01/2005',
    '01/06/2005',
  ];
  final List<String> lop = [
    'K17-CNTT_1',
    'K17-CNTT_1',
  ];

  String _developerHobbies(
    AppLocalizations l10n,
    int index,
  ) {
    switch (index) {
      case 0:
        return l10n.developerHobbies1;
      case 1:
        return l10n.developerHobbies2;
      default:
        return '';
    }
  }

  void _showMemberModal(
    BuildContext context,
    AppLocalizations l10n,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              18,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(14),
                  child: Image.asset(
                    avt[index],
                    width: 120,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        ten[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.studentIdLabel(
                          msv[index],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.dateOfBirthLabel(
                          ngaySinh[index],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.classLabel(
                          lop[index],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.hobbiesLabel(
                          _developerHobbies(
                            l10n,
                            index,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment:
                            Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pop(
                                context,
                              ),
                          child: Text(l10n.close),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(l10n.developersTitle),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: ten.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  avt[index],
                ),
              ),
              title: Text(
                ten[index],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                l10n.studentIdLabel(msv[index]),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () => _showMemberModal(
                context,
                l10n,
                index,
              ),
            ),
          );
        },
      ),
    );
  }
}
