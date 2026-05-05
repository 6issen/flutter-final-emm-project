import 'package:emm_final_project/data/datasources/app_database.dart';
import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/domain/entities/station_entity.dart';
import 'package:emm_final_project/domain/repositories/route_repository.dart';

class RouteRepositoryImpl implements IRouteRepository {
  final AppDatabase _db;

  RouteRepositoryImpl(this._db);

  RouteEntity _mapRoute(RoutesTableData data) => RouteEntity(
    id: data.id,
    locomotiveNumber: data.locomotiveNumber,
    section: data.section,
    partnerName: data.partnerName,
    callTime: data.callTime,
    acceptTime: data.acceptTime,
    releaseTime: data.releaseTime,
    startMeter: data.startMeter,
    endMeter: data.endMeter,
  );

  StationEntity _mapStation(StationsTableData data) => StationEntity(
    id: data.id,
    routeId: data.routeId,
    name: data.name,
    arrivalTime: data.arrivalTime,
    departureTime: data.departureTime,
  );

  @override
  Future<List<RouteEntity>> getAllRoutes() async {
    final results = await _db.select(_db.routesTable).get();
    return results.map(_mapRoute).toList();
  }

  @override
  Future<int> createRoute(RouteEntity route) async {
    return await _db.into(_db.routesTable).insert(RoutesTableCompanion.insert(
      locomotiveNumber: route.locomotiveNumber,
      section: route.section,
      partnerName: route.partnerName,
      callTime: route.callTime,
      acceptTime: route.acceptTime,
      startMeter: route.startMeter,
    ));
  }

  @override
  Future<void> deleteRoute(int id) async {
    await (_db.delete(_db.routesTable)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<List<StationEntity>> getStationsForRoute(int routeId) async {
    final results = await (_db.select(_db.stationsTable)..where((t) => t.routeId.equals(routeId))).get();
    return results.map(_mapStation).toList();
  }

  @override
  Future<void> addStation(StationEntity station) async {
    await _db.into(_db.stationsTable).insert(StationsTableCompanion.insert(
      routeId: station.routeId,
      name: station.name,
      arrivalTime: station.arrivalTime,
      departureTime: station.departureTime,
    ));
  }

  @override
  Future<void> deleteStation(int id) async {
    await (_db.delete(_db.stationsTable)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<RouteEntity?> getRouteById(int id) async {
    final result = await (_db.select(_db.routesTable)..where((t) => t.id.equals(id))).getSingleOrNull();
    return result != null ? _mapRoute(result) : null;
  }

  @override
  Future<void> updateRoute(RouteEntity route) async {
    if (route.id == null) return;
    await _db.update(_db.routesTable).replace(RoutesTableData(
      id: route.id!,
      locomotiveNumber: route.locomotiveNumber,
      section: route.section,
      partnerName: route.partnerName,
      callTime: route.callTime,
      acceptTime: route.acceptTime,
      releaseTime: route.releaseTime,
      startMeter: route.startMeter,
      endMeter: route.endMeter,
    ));
  }
}