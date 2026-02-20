// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Xin chào';

  @override
  String get setting => 'Cài đặt';

  @override
  String get account => 'Tài khoản';

  @override
  String get appTitle => 'Thời tiết';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get searchCityHint => 'Tìm thành phố...';

  @override
  String currentCityCount(int count) {
    return 'Số thành phố hiện tại: $count';
  }

  @override
  String get home => 'Trang chủ';

  @override
  String get viewProfile => 'Xem thông tin';

  @override
  String get settinglag => 'Ngôn ngữ';

  @override
  String get about => 'Giới thiệu';

  @override
  String get cityManager => 'Quản lý thành phố';

  @override
  String get backTooltip => 'Quay lại';

  @override
  String get addCity => 'Thêm thành phố';

  @override
  String get done => 'Xong';

  @override
  String get cancel => 'Huỷ';

  @override
  String get cityListFullMessage =>
      'Danh sách thành phố đã đầy (không còn thành phố để thêm).';

  @override
  String get detailContent => 'Nhấn để xem chi tiết';

  @override
  String get hourlyForecast => 'Dự báo theo giờ';

  @override
  String get sevenDayForecast => 'Dự báo 7 ngày';

  @override
  String detailTitle(String city) {
    return 'Chi tiết $city';
  }

  @override
  String todayWithDate(String date) {
    return 'Hôm nay, $date';
  }

  @override
  String get developersTitle => 'Thành viên phát triển';

  @override
  String get aboutAppHeadline =>
      'Weather App (Demo) — Ứng dụng thời tiết phục vụ học phần';

  @override
  String get aboutIntro =>
      'Ứng dụng được xây dựng với mục tiêu mô phỏng trải nghiệm xem thời tiết hiện đại trên thiết bị di động, đồng thời thể hiện đầy đủ các kỹ thuật cơ bản trong Flutter như: điều hướng nhiều màn hình (Navigator), quản lý trạng thái bằng setState, xây dựng UI theo Material Design, và tổ chức mã nguồn theo từng nhóm chức năng.';

  @override
  String get aboutHighlightsTitle => 'Điểm nổi bật';

  @override
  String get aboutHighlightHome =>
      '• Home Screen: hiển thị thành phố hiện tại, nhiệt độ, trạng thái thời tiết và icon minh hoạ.';

  @override
  String get aboutHighlightForecast =>
      '• Forecast: có dự báo theo giờ (danh sách ngang) và dự báo 7 ngày (danh sách dọc) để người dùng nắm xu hướng thời tiết.';

  @override
  String get aboutHighlightCityManagement =>
      '• City Management: quản lý danh sách thành phố mẫu (có thể thêm thành phố bằng “fake form”), chọn thành phố để cập nhật dữ liệu hiển thị trên Home.';

  @override
  String get aboutHighlightWeatherDetail =>
      '• Weather Detail: hiển thị các thông số chi tiết như độ ẩm, tốc độ gió, áp suất, UV Index và nhiệt độ cảm nhận (Feels Like).';

  @override
  String get aboutHighlightSettings =>
      '• Settings: hỗ trợ đổi ngôn ngữ, xem thông tin thành viên theo dạng modal (chia 2 phần: trái là ảnh, phải là thông tin chi tiết).';

  @override
  String get aboutDataScopeTitle => 'Dữ liệu & phạm vi';

  @override
  String get aboutDataScope =>
      'Trong phạm vi bài tập, dữ liệu thời tiết được thiết kế theo dạng hardcode (danh sách cố định trong Dart) nhằm tập trung vào việc trình bày giao diện, luồng điều hướng và trải nghiệm người dùng. Kiến trúc dữ liệu được tách riêng để về sau có thể thay thế bằng API thật (OpenWeather, WeatherAPI, ...) mà không cần thay đổi lớn về UI.';

  @override
  String get aboutFutureTitle => 'Hướng phát triển';

  @override
  String get aboutFutureBullet1 =>
      '• Tích hợp API thời tiết theo thời gian thực và cache dữ liệu.';

  @override
  String get detailPageTitle => 'Chi tiết';

  @override
  String get detailInfoTitle => 'Thông tin chi tiết';

  @override
  String get humidityLabel => 'Độ ẩm';

  @override
  String get windSpeedLabel => 'Tốc độ gió';

  @override
  String get pressureLabel => 'Áp suất khí quyển';

  @override
  String get uvIndexLabel => 'UV Index';

  @override
  String get feelsLikeLabel => 'Nhiệt độ cảm nhận';

  @override
  String studentIdLabel(String id) {
    return 'MSV: $id';
  }

  @override
  String dateOfBirthLabel(String date) {
    return 'Ngày sinh: $date';
  }

  @override
  String classLabel(String name) {
    return 'Lớp: $name';
  }

  @override
  String hobbiesLabel(String hobbies) {
    return 'Sở thích: $hobbies';
  }

  @override
  String get developerHobbies1 => 'Lập trình, đọc sách, bóng đá, du lịch';

  @override
  String get developerHobbies2 => 'Lập trình, nghe nhạc, cầu lông, bóng đá';

  @override
  String get close => 'Đóng';

  @override
  String get weatherSunny => 'Có nắng';

  @override
  String get weatherRainy => 'Có mưa';

  @override
  String get weatherCloudy => 'Nhiều mây';

  @override
  String get weatherStormWarning => 'Có mưa, Cảnh báo sấm sét';
}
