import 'package:emm_final_project/presentation/blocs/auth/auth_bloc.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_event.dart';
import 'package:emm_final_project/presentation/blocs/auth/auth_state.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_bloc.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_event.dart';
import 'package:emm_final_project/presentation/blocs/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Слушаем изменения: если BLoC говорит, что мы вышли (Unauthenticated), идем на логин
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go('/login');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Профиль'),
          centerTitle: true,
        ),
        // Строим интерфейс на основе данных из BLoC
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                // Обернул в SingleChildScrollView, чтобы не было ошибок переполнения на маленьких экранах
                child: SingleChildScrollView( 
                  child: Column(
                    children: [
                      const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                      const SizedBox(height: 16),
                      
                      // Берем реальное имя из стейта
                      Text(state.user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const Text('Машинист', style: TextStyle(color: Colors.grey)),
                      const Divider(height: 32),

                      // Данные профиля (остальные поля пока статичные для MVP)
                      _buildProfileItem(Icons.map, 'Участок', 'ПНХЗ - Павлодар'),
                      
                      // Берем реальный табельный номер из стейта
                      _buildProfileItem(Icons.badge, 'Табельный номер', state.user.tabNumber),
                      _buildProfileItem(Icons.fingerprint, 'Peer ID', '987654321'),
                      _buildProfileItem(Icons.phone, 'Номер телефона', '+7 707 123 45 67'),

                      const Divider(height: 40, indent: 20, endIndent: 20),

                      // Переключатель темы (Пока работает только визуально внутри этого экрана)
                      BlocBuilder<ThemeBloc, ThemeState>(
                        builder: (context, themeState) {
                          return SwitchListTile(
                            title: const Text('Тёмная тема'),
                            secondary: const Icon(Icons.dark_mode),
                            value: themeState.isDarkTheme,
                            onChanged: (val) {
                              // Отправляем событие на смену темы во всем приложении
                              context.read<ThemeBloc>().add(ToggleThemeEvent(val));
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Кнопка выхода в самом низу
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            padding: const EdgeInsets.all(16),
                          ),
                          onPressed: () {
                            // Правильный выход из системы: очищаем кэш и сессию
                            context.read<AuthBloc>().add(LogoutEvent());
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('ВЫЙТИ ИЗ СИСТЕМЫ'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}