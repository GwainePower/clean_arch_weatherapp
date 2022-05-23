import '../api/models/api_day.dart';
import '../../domain/models/day.dart';

class DayMapper {
  static Day fromApi(ApiDay apiDay) {
    return Day(
        sunrise: DateTime.tryParse(apiDay.sunrise)!,
        sunset: DateTime.tryParse(apiDay.sunset)!,
        solarNoon: DateTime.tryParse(apiDay.solarNoon)!,
        dayLength: apiDay.dayLength.toInt());
  }
}
