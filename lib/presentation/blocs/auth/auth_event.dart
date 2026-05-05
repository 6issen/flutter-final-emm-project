abstract class AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String tabNumber;
  final String password;
  LoginEvent(this.tabNumber, this.password);
}

class LogoutEvent extends AuthEvent {}