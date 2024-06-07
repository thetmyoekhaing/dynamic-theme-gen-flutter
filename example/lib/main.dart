import 'package:dynamic_theme_generator/dynamic_theme_generator.dart';
import 'package:example/material_color_picker.dart';
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
      create: (context) => ThemeProvider(
        themeManager: ThemeManager(customTheme: CUSTOMTHEMES.coffeeDark),
      ),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.themeManager.lightMode,
            darkTheme: themeProvider.themeManager.darkMode,
            themeMode: themeProvider.themeManager.themeMode,
            home: HomeScreen(
              brightness: themeProvider.themeManager.themeMode.toString(),
              updateTheme: (newTheme) {
                themeProvider.updateTheme(newTheme: newTheme);
              },
              toggleBrightness: themeProvider.toggleBrightness,
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
    required this.toggleBrightness,
    required this.updateTheme,
    required this.brightness,
  });

  final void Function() toggleBrightness;
  final void Function(ThemeData newTheme) updateTheme;
  final String brightness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Theme Example')),
      body: Center(
        child: Column(
          children: [
            CusContainer(
              color: colorScheme.primaryContainer,
              text: "Primary",
              textColor: colorScheme.primary,
            ),
            const SizedBox(height: 20),
            CusContainer(
              color: colorScheme.secondaryContainer,
              text: "secondary",
              textColor: colorScheme.secondary,
            ),
            const SizedBox(height: 20),
            CusContainer(
              color: colorScheme.tertiaryContainer,
              text: "tertiary",
              textColor: colorScheme.tertiary,
            ),
            const SizedBox(height: 20),
            CusContainer(
              color: colorScheme.errorContainer,
              text: "error",
              textColor: colorScheme.error,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              onPressed: toggleBrightness,
              child: const Text('Toggle light/dark mode'),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: MaterialColorPicker(
                pickerColor: colorScheme.primary,
                onColorChanged: (value) {
                  final theme = ThemeData(
                    brightness: Brightness.light,
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: value,
                      brightness: Brightness.light,
                    ),
                    textTheme: textTheme,
                  );
                  updateTheme(theme);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CusContainer extends StatelessWidget {
  const CusContainer({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        color: color,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: textColor,
              ),
        ),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeManager themeManager;

  ThemeProvider({required this.themeManager});

  void updateTheme({required ThemeData newTheme}) {
    themeManager.updateTheme(newTheme: newTheme);
    notifyListeners();
    debugPrint(
        "--------------------- updated ${themeManager.currentTheme.colorScheme.primary} ${themeManager.currentTheme.colorScheme.brightness} ------------------");
  }

  void toggleBrightness() {
    themeManager.toggleBrightness();
    notifyListeners();
  }
}
