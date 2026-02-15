import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(width: 12),
            const Text(
              'Giới thiệu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
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
            children: const [
              Text(
                'Weather App (Demo) — Ứng dụng thời tiết phục vụ học phần',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Ứng dụng được xây dựng với mục tiêu mô phỏng trải nghiệm xem thời tiết hiện đại trên thiết bị di động, đồng thời thể hiện đầy đủ các kỹ thuật cơ bản trong Flutter như: điều hướng nhiều màn hình (Navigator), quản lý trạng thái bằng setState, xây dựng UI theo Material Design, và tổ chức mã nguồn theo từng nhóm chức năng.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Điểm nổi bật',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Home Screen: hiển thị thành phố hiện tại, nhiệt độ, trạng thái thời tiết và icon minh hoạ.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                '• Forecast: có dự báo theo giờ (danh sách ngang) và dự báo 7 ngày (danh sách dọc) để người dùng nắm xu hướng thời tiết.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                '• City Management: quản lý danh sách thành phố mẫu (có thể thêm thành phố bằng “fake form”), chọn thành phố để cập nhật dữ liệu hiển thị trên Home.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                '• Weather Detail: hiển thị các thông số chi tiết như độ ẩm, tốc độ gió, áp suất, UV Index và nhiệt độ cảm nhận (Feels Like).',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              Text(
                '• Settings: hỗ trợ đổi ngôn ngữ, xem thông tin thành viên theo dạng modal (chia 2 phần: trái là ảnh, phải là thông tin chi tiết).',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Dữ liệu & phạm vi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Trong phạm vi bài tập, dữ liệu thời tiết được thiết kế theo dạng hardcode (danh sách cố định trong Dart) nhằm tập trung vào việc trình bày giao diện, luồng điều hướng và trải nghiệm người dùng. Kiến trúc dữ liệu được tách riêng để về sau có thể thay thế bằng API thật (OpenWeather, WeatherAPI, ...) mà không cần thay đổi lớn về UI.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Hướng phát triển',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Tích hợp API thời tiết theo thời gian thực và cache dữ liệu.',
                style: TextStyle(
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
