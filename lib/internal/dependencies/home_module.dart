import "repository_module.dart";
import '../../domain/states/home_state.dart';

class HomeModule {
  static HomeState homeState() => HomeState(RepositoryModule.dayRepository());
}
