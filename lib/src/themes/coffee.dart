import "package:dynamic_theme_generator/dynamic_theme_generator.dart";
import "package:flutter/material.dart";

class CoffeeTheme implements CustomTheme {
  CoffeeTheme();

  static MaterialScheme _lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff855318),
      surfaceTint: Color(0xff855318),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdcbe),
      onPrimaryContainer: Color(0xff2c1600),
      secondary: Color(0xff845416),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdcbc),
      onSecondaryContainer: Color(0xff2c1700),
      tertiary: Color(0xff636116),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffeae68e),
      onTertiaryContainer: Color(0xff1e1d00),
      error: Color(0xff86521a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdcbf),
      onErrorContainer: Color(0xff2d1600),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff211a14),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      surfaceVariant: Color(0xffeee1cf),
      onSurfaceVariant: Color(0xff4e4639),
      outline: Color(0xff7f7667),
      outlineVariant: Color(0xffd1c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inverseOnSurface: Color(0xfffdeee3),
      inversePrimary: Color(0xfffcb975),
      primaryFixed: Color(0xffffdcbe),
      onPrimaryFixed: Color(0xff2c1600),
      primaryFixedDim: Color(0xfffcb975),
      onPrimaryFixedVariant: Color(0xff693c00),
      secondaryFixed: Color(0xffffdcbc),
      onSecondaryFixed: Color(0xff2c1700),
      secondaryFixedDim: Color(0xfffbba73),
      onSecondaryFixedVariant: Color(0xff683d00),
      tertiaryFixed: Color(0xffeae68e),
      onTertiaryFixed: Color(0xff1e1d00),
      tertiaryFixedDim: Color(0xffceca75),
      onTertiaryFixedVariant: Color(0xff4b4900),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e6),
      surfaceContainer: Color(0xfffaebe0),
      surfaceContainerHigh: Color(0xfff4e6da),
      surfaceContainerHighest: Color(0xffeee0d5),
    );
  }

  @override
  ThemeData light() {
    return _theme(_lightScheme().toColorScheme());
  }

  static MaterialScheme _darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffcb975),
      surfaceTint: Color(0xfffcb975),
      onPrimary: Color(0xff4a2800),
      primaryContainer: Color(0xff693c00),
      onPrimaryContainer: Color(0xffffdcbe),
      secondary: Color(0xfffbba73),
      onSecondary: Color(0xff492900),
      secondaryContainer: Color(0xff683d00),
      onSecondaryContainer: Color(0xffffdcbc),
      tertiary: Color(0xffceca75),
      onTertiary: Color(0xff333200),
      tertiaryContainer: Color(0xff4b4900),
      onTertiaryContainer: Color(0xffeae68e),
      error: Color(0xfffeb876),
      onError: Color(0xff4b2800),
      errorContainer: Color(0xff6a3b02),
      onErrorContainer: Color(0xffffdcbf),
      background: Color(0xff19120c),
      onBackground: Color(0xffefe0d5),
      surface: Color(0xff18120c),
      onSurface: Color(0xffeee0d5),
      surfaceVariant: Color(0xff4e4639),
      onSurfaceVariant: Color(0xffd1c5b4),
      outline: Color(0xff9a8f80),
      outlineVariant: Color(0xff4e4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d5),
      inverseOnSurface: Color(0xff372f27),
      inversePrimary: Color(0xff855318),
      primaryFixed: Color(0xffffdcbe),
      onPrimaryFixed: Color(0xff2c1600),
      primaryFixedDim: Color(0xfffcb975),
      onPrimaryFixedVariant: Color(0xff693c00),
      secondaryFixed: Color(0xffffdcbc),
      onSecondaryFixed: Color(0xff2c1700),
      secondaryFixedDim: Color(0xfffbba73),
      onSecondaryFixedVariant: Color(0xff683d00),
      tertiaryFixed: Color(0xffeae68e),
      onTertiaryFixed: Color(0xff1e1d00),
      tertiaryFixedDim: Color(0xffceca75),
      onTertiaryFixedVariant: Color(0xff4b4900),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332c),
    );
  }

  @override
  ThemeData dark() {
    return _theme(_darkScheme().toColorScheme());
  }

  static ThemeData _theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}
