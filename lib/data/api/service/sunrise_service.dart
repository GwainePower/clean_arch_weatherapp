import 'package:clean_arch_weatherapp/domain/models/day.dart';
import 'package:dio/dio.dart';
import '../models/api_day.dart';
import '../request/get_day_body.dart';

class SunriseService {
  static const baseUrl = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<ApiDay> getDay(GetDayBody dayBody) async {
    final response = await _dio.get('/json', queryParameters: dayBody.toApi());
    return ApiDay.fromApi(response.data);
  }
}
