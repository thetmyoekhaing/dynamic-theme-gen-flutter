import 'package:dynamic_theme_generator/dynamic_theme_generator.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeData _currentTheme;
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
        _customtheme = customTheme;

  ThemeData get currentTheme => _currentTheme;
  ThemeMode get themeMode => _currentTheme.brightness == Brightness.light
      ? ThemeMode.light
      : ThemeMode.dark;

  ThemeData get lightMode => _customtheme != null
      ? getLight(_customtheme)
      : ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: _currentTheme.colorScheme.primary,
            brightness: Brightness.light,
          ),
        );

  ThemeData get darkMode => _customtheme != null
      ? getDark(_customtheme)
      : ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: _currentTheme.colorScheme.primary,
            brightness: Brightness.dark,
          ),
        );

  void updateTheme({required ThemeData newTheme}) {
    _currentTheme = newTheme;
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
