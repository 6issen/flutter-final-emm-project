abstract class ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}

// Событие переключения темы
class ToggleThemeEvent extends ThemeEvent {
  final bool isDark;
  ToggleThemeEvent(this.isDark);
}