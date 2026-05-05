import 'package:emm_final_project/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<UserEntity?> login(String tabNumber, String password);
  Future<void> logout();
  Future<UserEntity?> checkSession();
}