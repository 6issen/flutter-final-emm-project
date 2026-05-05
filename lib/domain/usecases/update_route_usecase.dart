import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/domain/repositories/route_repository.dart';

class UpdateRouteUseCase {
  final IRouteRepository repository;

  UpdateRouteUseCase(this.repository);

  Future<void> call(RouteEntity route) async {
    await repository.updateRoute(route);
  }
}