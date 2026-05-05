import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/domain/repositories/route_repository.dart';

class CreateRouteUseCase {
  final IRouteRepository repository;

  CreateRouteUseCase(this.repository);

  Future<void> call(RouteEntity route) async {
    if (route.locomotiveNumber.isEmpty) {
      throw Exception('Номер локомотива не может быть пустым');
    }
    await repository.createRoute(route);
  }
}