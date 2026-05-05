import 'package:emm_final_project/domain/entities/user.dart';
import 'package:emm_final_project/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepositoryImpl implements IAuthRepository {
  final SharedPreferences prefs;

  AuthRepositoryImpl(this.prefs);

  @override
  Future<UserEntity?> login(String tabNumber, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (tabNumber.isNotEmpty && password == '1234') {
      await prefs.setString('tab_number', tabNumber);
      return UserEntity(tabNumber: tabNumber, name: 'Машинист $tabNumber');
    }
    throw Exception('Неверный табельный номер или пароль');
  }

  @override
  Future<void> logout() async {
    await prefs.remove('tab_number');
  }

  @override
  Future<UserEntity?> checkSession() async {
    final tabNumber = prefs.getString('tab_number');
    if (tabNumber != null) {
      return UserEntity(tabNumber: tabNumber, name: 'Машинист $tabNumber');
    }
    return null;
  }
}