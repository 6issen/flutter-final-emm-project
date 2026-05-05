import 'package:emm_final_project/domain/repositories/route_repository.dart';

class DeleteRouteUseCase {
  final IRouteRepository repository;

  DeleteRouteUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.deleteRoute(id);
  }
}