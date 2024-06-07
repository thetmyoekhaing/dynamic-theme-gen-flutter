import 'package:dynamic_theme_generator/dynamic_theme_generator.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData _currentTheme;
  ThemeData _lightMode;
  ThemeData _darkMode;
  final CUSTOMTHEMES? _customtheme;

  ThemeManager({
    Color? baseColor,
    ThemeData? initialTheme,
    CUSTOMTHEMES? customTheme,
  })  : _currentTheme = customTheme != null
            ? getTheme(customTheme)
            : initialTheme ??
                ThemeData(
                  colorScheme: baseColor == null
                      ? ColorScheme.fromSwatch()
                      : ColorScheme.fromSeed(seedColor: baseColor),
                ),
        _customtheme = customTheme,
        _lightMode = customTheme != null
            ? getLight(customTheme)
            : ThemeData(
                colorScheme: baseColor == null
                    ? ColorScheme.fromSwatch()
                    : ColorScheme.fromSeed(seedColor: baseColor),
                brightness: Brightness.light),
        _darkMode = customTheme != null
            ? getDark(customTheme)
            : ThemeData(
                colorScheme: baseColor == null
                    ? ColorScheme.fromSwatch()
                    : ColorScheme.fromSeed(seedColor: baseColor),
                brightness: Brightness.dark);

  ThemeData get currentTheme => _currentTheme;
  ThemeMode get themeMode => _currentTheme.brightness == Brightness.light
      ? ThemeMode.light
      : ThemeMode.dark;

  ThemeData get lightMode => _lightMode;

  set setLightMode(ThemeData light) {
    _lightMode = light;
  }

  set setDarkMode(ThemeData dark) {
    _darkMode = dark;
  }

  ThemeData get darkMode => _darkMode;

  void updateTheme({required ThemeData newTheme}) {
    // _currentTheme = newTheme;
    if (newTheme.colorScheme.brightness == Brightness.light) {
      setLightMode = newTheme;
      setDarkMode = ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: newTheme.colorScheme.primary,
        ),
      );
    } else {
      setDarkMode = newTheme;
      setLightMode = ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: newTheme.colorScheme.primary,
        ),
      );
    }
  }

  void toggleBrightness() {
    if (themeMode == ThemeMode.dark) {
      _currentTheme = lightMode;
    } else {
      _currentTheme = darkMode;
    }
  }

  ThemeManager copyWith({ThemeData? currentTheme, CUSTOMTHEMES? customTheme}) {
    return ThemeManager(
      initialTheme: currentTheme ?? _currentTheme,
      customTheme: customTheme ?? _customtheme,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeManager &&
          runtimeType == other.runtimeType &&
          currentTheme == other.currentTheme &&
          _customtheme == other._customtheme;

  @override
  int get hashCode => currentTheme.hashCode ^ _customtheme.hashCode;
}
