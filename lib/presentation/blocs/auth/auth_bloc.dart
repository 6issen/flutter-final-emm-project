import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emm_final_project/domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<CheckAuthEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.checkSession();
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(Unauthenticated());
        }
      } catch (_) {
        emit(Unauthenticated());
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.login(event.tabNumber, event.password);
        if (user != null) {
          emit(Authenticated(user));
        }
      } catch (e) {
        emit(AuthError(e.toString().replaceAll('Exception: ', '')));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      await repository.logout();
      emit(Unauthenticated());
    });
  }
}