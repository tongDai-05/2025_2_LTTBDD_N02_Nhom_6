import 'package:bai_tap_lon_cuoi_ki/Languages/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
    '02/02/2005',
  ];
  final List<String> lop = [
    'LTTBDD N02',
    'LTTBDD N02',
  ];
  final List<String> soThich = [
    'Lập trình, đọc sách, bóng đá',
    'Lập trình, nghe nhạc, du lịch',
  ];

  void _showMemberModal(
    BuildContext context,
    AppLocalizations? l10n,
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
                        l10n?.studentIdLabel(
                              msv[index],
                            ) ??
                            'MSV: ${msv[index]}',
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Ngày sinh: ${ngaySinh[index]}',
                      ),
                      const SizedBox(height: 6),
                      Text('Lớp: ${lop[index]}'),
                      const SizedBox(height: 6),
                      Text(
                        'Sở thích: ${soThich[index]}',
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
                          child: const Text(
                            'Đóng',
                          ),
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
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          l10n?.developersTitle ?? "Developers",
        ),
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
                l10n?.studentIdLabel(
                      msv[index],
                    ) ??
                    "MSV: ${msv[index]}",
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
