import 'package:dynamic_theme_generator/dynamic_theme_generator.dart';
import 'package:flutter/material.dart';

enum CUSTOMTHEMES {
  coffee,
  coffeeDark,
}

abstract class CustomTheme {
  ThemeData light();
  ThemeData dark();
}

ThemeData getLight(CUSTOMTHEMES theme) {
  switch (theme) {
    case CUSTOMTHEMES.coffee || CUSTOMTHEMES.coffeeDark:
      return CoffeeTheme().light();
    default:
      return ThemeData.light();
  }
}

ThemeData getDark(CUSTOMTHEMES theme) {
  switch (theme) {
    case CUSTOMTHEMES.coffee || CUSTOMTHEMES.coffeeDark:
      return CoffeeTheme().dark();
    default:
      return ThemeData.dark();
  }
}

ThemeData getTheme(CUSTOMTHEMES theme) {
  switch (theme) {
    case CUSTOMTHEMES.coffeeDark:
      return CoffeeTheme().dark();
    case CUSTOMTHEMES.coffee:
      return CoffeeTheme().light();
    default:
      return ThemeData.light();
  }
}
