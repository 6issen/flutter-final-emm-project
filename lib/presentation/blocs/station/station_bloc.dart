import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emm_final_project/domain/repositories/route_repository.dart';
import 'station_event.dart';
import 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final IRouteRepository repository;

  StationBloc({required this.repository}) : super(StationInitialState()) {

    // Загрузка станций для конкретного маршрута
    on<LoadStationsEvent>((event, emit) async {
      emit(StationLoadingState());
      try {
        final stations = await repository.getStationsForRoute(event.routeId);
        emit(StationLoadedState(stations));
      } catch (e) {
        emit(StationErrorState('Ошибка загрузки станций: $e'));
      }
    });

    // Добавление новой станции
    on<AddStationEvent>((event, emit) async {
      emit(StationLoadingState());
      try {
        await repository.addStation(event.station);
        final stations = await repository.getStationsForRoute(event.station.routeId);
        emit(StationLoadedState(stations));
      } catch (e) {
        emit(StationErrorState('Ошибка добавления: $e'));
      }
    });

    // Удаление станции
    on<DeleteStationEvent>((event, emit) async {
      emit(StationLoadingState());
      try {
        await repository.deleteStation(event.stationId);
        final stations = await repository.getStationsForRoute(event.routeId);
        emit(StationLoadedState(stations));
      } catch (e) {
        emit(StationErrorState('Ошибка удаления: $e'));
      }
    });
  }
}