import '../../data/repository/day_data_repository.dart';
import '../../domain/repository/day_repo.dart';

import 'api_module.dart';

class RepositoryModule {
  static DayRepository? _dayRepository;

  static DayRepository dayRepository() {
    _dayRepository ??= DayDataRepository(ApiModule.apiUtil());
    return _dayRepository!;
  }
}
