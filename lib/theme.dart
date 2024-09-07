import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff972600),
      surfaceTint: Color(0xffb02e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd83a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffa63a19),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffff8a69),
      onSecondaryContainer: Color(0xff430c00),
      tertiary: Color(0xff654d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff917000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff281712),
      onSurfaceVariant: Color(0xff5d4038),
      outline: Color(0xff916f66),
      outlineVariant: Color(0xffe6bdb2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3f2c26),
      inversePrimary: Color(0xffffb5a0),
      primaryFixed: Color(0xffffdbd1),
      onPrimaryFixed: Color(0xff3b0900),
      primaryFixedDim: Color(0xffffb5a0),
      onPrimaryFixedVariant: Color(0xff872100),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff3b0900),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff862303),
      tertiaryFixed: Color(0xffffdf94),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xffeec146),
      onTertiaryFixedVariant: Color(0xff594400),
      surfaceDim: Color(0xfff3d3cb),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ed),
      surfaceContainer: Color(0xffffe9e4),
      surfaceContainerHigh: Color(0xffffe2da),
      surfaceContainerHighest: Color(0xfffcdbd3),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff801f00),
      surfaceTint: Color(0xffb02e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd83a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff801f00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc44f2d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff544000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff917000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff281712),
      onSurfaceVariant: Color(0xff583c34),
      outline: Color(0xff77584f),
      outlineVariant: Color(0xff957369),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3f2c26),
      inversePrimary: Color(0xffffb5a0),
      primaryFixed: Color(0xffd83a00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffac2d00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffc44f2d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xffa33817),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff917000),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff735800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xfff3d3cb),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ed),
      surfaceContainer: Color(0xffffe9e4),
      surfaceContainerHigh: Color(0xffffe2da),
      surfaceContainerHighest: Color(0xfffcdbd3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff470d00),
      surfaceTint: Color(0xffb02e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff801f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff470d00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff801f00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2d2000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff544000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff361e17),
      outline: Color(0xff583c34),
      outlineVariant: Color(0xff583c34),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3f2c26),
      inversePrimary: Color(0xffffe7e1),
      primaryFixed: Color(0xff801f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff591300),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff801f00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff591300),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff544000),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff392b00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xfff3d3cb),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color.fromARGB(255, 176, 171, 194),
      surfaceContainer: Color(0xffffe9e4),
      surfaceContainerHigh: Color(0xffffe2da),
      surfaceContainerHighest: Color(0xfffcdbd3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb5a0),
      surfaceTint: Color(0xffffb5a0),
      onPrimary: Color(0xff601500),
      primaryContainer: Color(0xffd83a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffb5a0),
      onSecondary: Color(0xff601500),
      secondaryContainer: Color(0xff7b1d00),
      onSecondaryContainer: Color(0xffffc9bb),
      tertiary: Color(0xffeec146),
      onTertiary: Color(0xff3e2e00),
      tertiaryContainer: Color(0xff917000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1f0f0b),
      onSurface: Color(0xfffcdbd3),
      onSurfaceVariant: Color(0xffe6bdb2),
      outline: Color(0xffad887f),
      outlineVariant: Color(0xff5d4038),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfffcdbd3),
      inversePrimary: Color(0xffb02e00),
      primaryFixed: Color(0xffffdbd1),
      onPrimaryFixed: Color(0xff3b0900),
      primaryFixedDim: Color(0xffffb5a0),
      onPrimaryFixedVariant: Color(0xff872100),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff3b0900),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff862303),
      tertiaryFixed: Color(0xffffdf94),
      onTertiaryFixed: Color(0xff251a00),
      tertiaryFixedDim: Color(0xffeec146),
      onTertiaryFixedVariant: Color(0xff594400),
      surfaceDim: Color(0xff1f0f0b),
      surfaceBright: Color(0xff49342f),
      surfaceContainerLowest: Color(0xff190a06),
      surfaceContainerLow: Color(0xff281712),
      surfaceContainer: Color(0xff2d1b16),
      surfaceContainerHigh: Color(0xff382520),
      surfaceContainerHighest: Color(0xff44302a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbba8),
      surfaceTint: Color(0xffffb5a0),
      onPrimary: Color(0xff320700),
      primaryContainer: Color(0xffff5723),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbba8),
      onSecondary: Color(0xff320700),
      secondaryContainer: Color(0xffe96a46),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3c54a),
      onTertiary: Color(0xff1e1500),
      tertiaryContainer: Color(0xffb38b0a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1f0f0b),
      onSurface: Color(0xfffff9f8),
      onSurfaceVariant: Color(0xffebc2b7),
      outline: Color(0xffc09a90),
      outlineVariant: Color(0xff9e7b71),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfffcdbd3),
      inversePrimary: Color(0xff892200),
      primaryFixed: Color(0xffffdbd1),
      onPrimaryFixed: Color(0xff290500),
      primaryFixedDim: Color(0xffffb5a0),
      onPrimaryFixedVariant: Color(0xff6a1800),
      secondaryFixed: Color(0xffffdbd1),
      onSecondaryFixed: Color(0xff290500),
      secondaryFixedDim: Color(0xffffb5a0),
      onSecondaryFixedVariant: Color(0xff6a1800),
      tertiaryFixed: Color(0xffffdf94),
      onTertiaryFixed: Color(0xff181000),
      tertiaryFixedDim: Color(0xffeec146),
      onTertiaryFixedVariant: Color(0xff453400),
      surfaceDim: Color(0xff1f0f0b),
      surfaceBright: Color(0xff49342f),
      surfaceContainerLowest: Color(0xff190a06),
      surfaceContainerLow: Color(0xff281712),
      surfaceContainer: Color(0xff2d1b16),
      surfaceContainerHigh: Color(0xff382520),
      surfaceContainerHighest: Color(0xff44302a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffffb5a0),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbba8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbba8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff3c54a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1f0f0b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xffebc2b7),
      outlineVariant: Color(0xffebc2b7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfffcdbd3),
      inversePrimary: Color(0xff541100),
      primaryFixed: Color(0xffffe0d8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbba8),
      onPrimaryFixedVariant: Color(0xff320700),
      secondaryFixed: Color(0xffffe0d8),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbba8),
      onSecondaryFixedVariant: Color(0xff320700),
      tertiaryFixed: Color(0xffffe4a8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff3c54a),
      onTertiaryFixedVariant: Color(0xff1e1500),
      surfaceDim: Color(0xff1f0f0b),
      surfaceBright: Color(0xff49342f),
      surfaceContainerLowest: Color(0xff190a06),
      surfaceContainerLow: Color(0xff281712),
      surfaceContainer: Color(0xff2d1b16),
      surfaceContainerHigh: Color(0xff382520),
      surfaceContainerHighest: Color(0xff44302a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
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

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
