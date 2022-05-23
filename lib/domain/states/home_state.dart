import 'package:mobx/mobx.dart';
import '../repository/day_repo.dart';
import '../models/day.dart';

part 'home_state.g.dart';

/*
Поле day помечено аннотацией @observable, изменение значения этого
поля будет отслеживаться на уровне представления и при необходимости перерисовывать экран.

Аналогичной аннотацией помечена и переменная isLoading - её мы будем использовать
для определения момента, когда выполняется асинхронная операция и необходимо показать лоадер.

Также имеется метод, помеченный аннотацией @action, то есть то самое событие,
инициирующее изменение состояния. В данном случае, мы будем вызывать его для того,
чтобы получить данные из репозитория.
*/

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  final DayRepository _dayRepository;

  HomeStateBase(this._dayRepository);

  @observable
  Day? day;

  @observable
  bool isLoading = false;

  @action
  Future<void> getDay({
    required double latitude,
    required double longitude,
  }) async {
    isLoading = true;
    final data = await _dayRepository.getDay(
      latitude: latitude,
      longitude: longitude,
    );
    day = data;
    isLoading = false;
  }
}
