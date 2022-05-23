import '../api/api_util.dart';
import '../../domain/models/day.dart';
import '../../domain/repository/day_repo.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({
    required double latitude,
    required double longitude,
  }) =>
      _apiUtil.getDay(
        latitude: latitude,
        longitude: longitude,
      );
}
