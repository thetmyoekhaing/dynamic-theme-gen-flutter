// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'src.dart';

class ThemeManager {
  ThemeModel? _currentTheme;

  ThemeManager({
    ThemeModel? currentTheme,
  }) : _currentTheme = currentTheme;

  ThemeModel? get currentTheme => _currentTheme;

  void updateTheme({
    ThemeModel? newTheme,
    Color? newPrimaryColor,
    Color? newSecondaryColor,
    Brightness? brightness,
    ThemeData? themeData,
  }) {
    _currentTheme = newTheme ??
        _currentTheme?.copyWith(
          primaryColor: newPrimaryColor,
          secondaryColor: newSecondaryColor,
          brightness: brightness,
          themeData: themeData,
        );
  }
}
