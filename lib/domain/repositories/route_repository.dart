
import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/domain/entities/station_entity.dart';

abstract class IRouteRepository {
  Future<List<RouteEntity>> getAllRoutes();
  Future<RouteEntity?> getRouteById(int id);
  Future<int> createRoute(RouteEntity route);
  Future<void> updateRoute(RouteEntity route);
  Future<void> deleteRoute(int id);
  Future<List<StationEntity>> getStationsForRoute(int routeId);
  Future<void> addStation(StationEntity station);
  Future<void> deleteStation(int id);
}