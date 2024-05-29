# Dynamic Theme Generator for Flutter

## Overview

The Dynamic Theme Generator is a Flutter package designed to facilitate the implementation of dynamic and customizable themes in Flutter applications. It allows real-time theme switching, enhancing user experience by enabling custom color schemes and brightness modes.

## Features

-   **Real-Time Theme Switching** (done): Instantly apply new themes without restarting the app.
-   **Custom Color Schemes** (done): Customize color scheme based on user or yourself.
-   **Brightness Control** (done): Seamless switching between light and dark modes.
-   **Persisted Themes** (undone): Save and load user-selected themes across app sessions.
-   **Predefined Themes** (undone): Provide a set of predefined themes (retro, cyberbunk, minimalism, brutalism, etc...) for quick integration.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
    dynamic_theme_generator:
        git: https://github.com/thetmyoekhaing/dynamic-theme-gen-flutter.git
        ref: main
```

## Example

```dart
import 'dart:math';

import 'package:dynamic_theme_generator/dynamic_theme_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.themeManager.currentTheme?.toThemeData(),
            home: HomeScreen(
              updateTheme: (newTheme) =>
                  themeProvider.updateTheme(newTheme: newTheme),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.updateTheme,
  });

  final void Function(ThemeModel newTheme) updateTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Theme Example')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            final newTheme = ThemeModel(
              primaryColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              secondaryColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            );

            updateTheme(newTheme);
          },
          child: const Text('Change Theme'),
        ),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  final themeManager = ThemeManager();

  void updateTheme({ThemeModel? newTheme}) {
    themeManager.updateTheme(newTheme: newTheme);
    notifyListeners();
  }
}

```

## Checklist

-   [x] Creating dynamic themes in real-time
-   [x] Providing custom color schemes
-   [x] Brightness control (light/dark mode)
-   [ ] Persisting user-selected themes
-   [ ] Providing predefined themes

## Future Plans

-   **Predefined Themes**: Add a collection of predefined themes for quick integration.
-   **Theme Editor**: Create an in-app theme editor for end-users to customize themes.
-   **Theme Animations**: Implement smooth transitions and animations between theme changes.

## Contributions

Contributions are welcome! Please feel free to submit issues, feature requests, and pull requests on GitHub.

## License

This project is licensed under the MIT License.

---
