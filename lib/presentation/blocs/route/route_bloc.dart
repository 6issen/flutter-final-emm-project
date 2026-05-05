import 'package:emm_final_project/domain/usecases/create_route_usecase.dart';
import 'package:emm_final_project/domain/usecases/delete_route_usecase.dart';
import 'package:emm_final_project/domain/usecases/get_all_routes_usecase.dart';
import 'package:emm_final_project/domain/usecases/update_route_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'route_event.dart';
import 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final GetAllRoutesUseCase getAllRoutes;
  final CreateRouteUseCase createRoute;
  final UpdateRouteUseCase updateRoute;
  final DeleteRouteUseCase deleteRoute;

  RouteBloc({
    required this.getAllRoutes,
    required this.createRoute,
    required this.updateRoute,
    required this.deleteRoute,
  }) : super(RouteInitialState()) {
    
    // Загрузка
    on<LoadRoutesEvent>((event, emit) async {
      emit(RouteLoadingState());
      try {
        final routes = await getAllRoutes.call();
        emit(RouteLoadedState(routes));
      } catch (e) {
        emit(RouteErrorState('Ошибка загрузки: $e'));
      }
    });

    // Создание
    on<CreateRouteEvent>((event, emit) async {
      emit(RouteLoadingState());
      try {
        await createRoute(event.route);
        final routes = await getAllRoutes();
        emit(RouteLoadedState(routes));
      } catch (e) {
        emit(RouteErrorState('Ошибка создания: $e'));
      }
    });

    // Обновление (Завершение/Редактирование)
    on<UpdateRouteEvent>((event, emit) async {
      emit(RouteLoadingState());
      try {
        await updateRoute(event.route);
        final routes = await getAllRoutes();
        emit(RouteLoadedState(routes));
      } catch (e) {
        emit(RouteErrorState('Ошибка обновления: $e'));
      }
    });

    // Удаление
    on<DeleteRouteEvent>((event, emit) async {
      emit(RouteLoadingState());
      try {
        await deleteRoute(event.id);
        final routes = await getAllRoutes();
        emit(RouteLoadedState(routes));
      } catch (e) {
        emit(RouteErrorState('Ошибка удаления: $e'));
      }
    });
  }
}