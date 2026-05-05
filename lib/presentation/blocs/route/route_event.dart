import 'package:emm_final_project/domain/entities/route_entity.dart';
abstract class RouteEvent {}

class LoadRoutesEvent extends RouteEvent {}

class CreateRouteEvent extends RouteEvent {
  final RouteEntity route;
  CreateRouteEvent(this.route);
}

class DeleteRouteEvent extends RouteEvent {
  final int id;
  DeleteRouteEvent(this.id);
}

class UpdateRouteEvent extends RouteEvent {
  final RouteEntity route;
  UpdateRouteEvent(this.route);
}