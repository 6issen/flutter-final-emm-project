

import 'package:emm_final_project/domain/entities/route_entity.dart';
import 'package:emm_final_project/domain/repositories/route_repository.dart';

class GetAllRoutesUseCase {
  final IRouteRepository repository;

  GetAllRoutesUseCase(this.repository);

  Future<List<RouteEntity>> call() async {  
    return await repository.getAllRoutes();
  }
}