import 'package:emm_final_project/domain/entities/station_entity.dart';

abstract class StationState {}

class StationInitialState extends StationState {}

class StationLoadingState extends StationState {}

class StationLoadedState extends StationState {
  final List<StationEntity> stations;
  StationLoadedState(this.stations);
}

class StationErrorState extends StationState {
  final String message;
  StationErrorState(this.message);
}