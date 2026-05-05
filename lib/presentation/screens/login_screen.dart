import 'package:emm_final_project/presentation/blocs/auth/auth_bloc.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_event.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _tabNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _tabNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        // Listener реагирует на изменение состояния (без перерисовки UI)
        listener: (context, state) {
          if (state is Authenticated) {
            // Если авторизация успешна — идем на главный экран
            context.go('/home');
          } else if (state is AuthError) {
            // Если ошибка — показываем красную всплывашку
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        // Builder рисует сам интерфейс
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.train, size: 80, color: Colors.blue),
                    const SizedBox(height: 24),
                    const Text(
                      'Маршрут машиниста',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Авторизация в системе',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 48),

                    TextField(
                      controller: _tabNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Табельный номер',
                        prefixIcon: Icon(Icons.badge),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Пароль',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true, // Скрывает пароль звездочками
                    ),
                    const SizedBox(height: 32),

                    // Если грузится — показываем крутилку, иначе кнопку
                    if (state is AuthLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          // Отправляем событие входа в BLoC
                          context.read<AuthBloc>().add(
                            LoginEvent(
                              _tabNumberController.text,
                              _passwordController.text,
                            ),
                          );
                        },
                        child: const Text('ВОЙТИ', style: TextStyle(fontSize: 16)),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}