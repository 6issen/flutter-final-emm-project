import 'package:emm_final_project/domain/entities/station_entity.dart';

abstract class StationEvent {}

class LoadStationsEvent extends StationEvent {
  final int routeId;
  LoadStationsEvent(this.routeId);
}

class AddStationEvent extends StationEvent {
  final StationEntity station;
  AddStationEvent(this.station);
}

class DeleteStationEvent extends StationEvent {
  final int stationId;
  final int routeId;
  DeleteStationEvent(this.stationId, this.routeId);
}