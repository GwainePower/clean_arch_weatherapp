import '../models/day.dart';

// Это интерфейс репозитория для получения данных о дне
abstract class DayRepository {
  Future<Day> getDay({
    required double latitude,
    required double longitude,
  });
}
