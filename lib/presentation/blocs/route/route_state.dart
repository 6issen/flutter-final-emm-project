import 'package:emm_final_project/domain/entities/route_entity.dart';

abstract class RouteState {}

class RouteInitialState extends RouteState {}

class RouteLoadingState extends RouteState {}

// Успешно загрузили маршруты
class RouteLoadedState extends RouteState {
  final List<RouteEntity> routes;
  RouteLoadedState(this.routes);
}

// Ошибка при загрузке или сохранении
class RouteErrorState extends RouteState {
  final String message;
  RouteErrorState(this.message);
}