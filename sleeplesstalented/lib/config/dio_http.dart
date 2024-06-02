import 'package:sleeplesstalented/config/base_url.dart';
import 'package:dio/dio.dart';

class DioHttp {
  // This is a standardized request for everyone
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static Dio request = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      // Uncomment this line if you need to validate statuses manually
      // validateStatus: (status) => status! <= 500,
    ),
  );
}
