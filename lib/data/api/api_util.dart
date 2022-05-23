import './request/get_day_body.dart';
import '../mapper/day_mapper.dart';
import './service/sunrise_service.dart';
import '../../domain/models/day.dart';

/*
Фактически, класс ApiUtil служит единой точкой входа в мир API для всех репозиториев,
самостоятельно решая, к какому сервису обращаться за данными. Если завтра нам потребуется
получать координаты городов из другого сервиса, или погоду из третьего, мы будем решать это
на уровнях ApiUtil-ApiServiсe, а для всех репозиториев это будет выглядеть как будто мы получаем
все данные из одного источника. В этом и заключается преимущество такого подхода.
*/

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay({
    required double latitude,
    required double longitude,
  }) async {
    final dayBody = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunriseService.getDay(dayBody);
    return DayMapper.fromApi(result);
  }
}
