// import 'package:flutter/material.dart';

// class ThemeModel {
//   final Color? primaryColor;
//   final Color? secondaryColor;
//   final Brightness? brightness;
//   final ThemeData? themeData;

//   const ThemeModel({
//     this.primaryColor,
//     this.secondaryColor,
//     this.brightness,
//     this.themeData,
//   });

//   ThemeData toThemeData() {
//     return themeData ??
//         ThemeData(
//           primaryColor: primaryColor,
//           brightness: brightness,
//           colorScheme: ColorScheme.fromSwatch(
//             primarySwatch: createMaterialColor(primaryColor!),
//             brightness: brightness ?? Brightness.light,
//           ).copyWith(
//             secondary: secondaryColor,
//           ),
//         );
//   }

//   ThemeModel copyWith({
//     Color? primaryColor,
//     Color? secondaryColor,
//     Brightness? brightness,
//     ThemeData? themeData,
//   }) {
//     return ThemeModel(
//       primaryColor: primaryColor ?? this.primaryColor,
//       secondaryColor: secondaryColor ?? this.secondaryColor,
//       brightness: brightness ?? this.brightness,
//       themeData: themeData ?? this.themeData,
//     );
//   }

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ThemeModel &&
//           runtimeType == other.runtimeType &&
//           primaryColor == other.primaryColor &&
//           secondaryColor == other.secondaryColor &&
//           brightness == other.brightness &&
//           themeData == other.themeData;

//   @override
//   int get hashCode =>
//       primaryColor.hashCode ^
//       secondaryColor.hashCode ^
//       brightness.hashCode ^
//       themeData.hashCode;

//   MaterialColor createMaterialColor(Color color) {
//     List strengths = <double>[.05];
//     final swatch = <int, Color>{};
//     final int r = color.red, g = color.green, b = color.blue;

//     for (int i = 1; i < 10; i++) {
//       strengths.add(0.1 * i);
//     }
//     for (var strength in strengths) {
//       final double ds = 0.5 - strength;
//       swatch[(strength * 1000).round()] = Color.fromRGBO(
//         r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//         g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//         b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//         1,
//       );
//     }
//     return MaterialColor(color.value, swatch);
//   }
// }
