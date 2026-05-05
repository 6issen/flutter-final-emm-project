import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences prefs;
  static const _themeKey = 'is_dark_theme';

  ThemeBloc({required this.prefs}) : super(ThemeState(isDarkTheme: false)) {
    
    // Загружаем тему из памяти при запуске
    on<LoadThemeEvent>((event, emit) {
      final isDark = prefs.getBool(_themeKey) ?? false;
      emit(ThemeState(isDarkTheme: isDark));
    });

    // Переключаем и сохраняем новую тему
    on<ToggleThemeEvent>((event, emit) async {
      await prefs.setBool(_themeKey, event.isDark);
      emit(ThemeState(isDarkTheme: event.isDark));
    });
  }
}