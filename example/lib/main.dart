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
