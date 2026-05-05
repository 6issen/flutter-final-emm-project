import 'package:emm_final_project/domain/entities/user.dart';
import 'package:emm_final_project/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserEntity?> login(String tabNumber, String password) async {
    try {
      // В Firebase Auth обычно используется email. 
      // Если tabNumber — это просто цифры, дополним его доменом.
      final email = tabNumber.contains('@') ? tabNumber : '$tabNumber@emm.kz';
      
      final UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        return UserEntity(
          tabNumber: tabNumber,
          name: user.displayName ?? 'Машинист $tabNumber',
        );
      }
      return null;
    } on FirebaseAuthException catch (e) {
      String message = 'Ошибка авторизации';
      if (e.code == 'user-not-found') {
        message = 'Пользователь не найден';
      } else if (e.code == 'wrong-password') {
        message = 'Неверный пароль';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception('Произошла ошибка: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserEntity?> checkSession() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final tabNumber = user.email?.split('@').first ?? '';
      return UserEntity(
        tabNumber: tabNumber,
        name: user.displayName ?? 'Машинист $tabNumber',
      );
    }
    return null;
  }
}
