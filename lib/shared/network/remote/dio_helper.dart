import 'package:dio/dio.dart';
import 'package:library_app/shared/components/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    String? token,
    String? lang = 'ar', 
  }) async {
    print(accessToken);
    dio!.options.headers = {
      'Content-Type':
          'multipart/form-data; boundary=<calculated when request is sent>',
      'Authorization': 'Bearer $token'
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required data,
    token,
    lang,
    Map<String, dynamic>? query,
   bool? onSendProgress,
   bool? cubit,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    return await dio!.post(
      url,
      data: data,
      queryParameters: query,
      onSendProgress: (count, total) => print('$count, $total'),
    );
  }
}
