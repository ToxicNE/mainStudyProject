// ignore_for_file: deprecated_member_use

part of 'theme.dart';

ThemeData materialThemeFromAppTheme(AppThemeData theme, Brightness brightness) => ThemeData(
      textTheme: theme.textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: theme.main.primary,
        onPrimary: theme.main.onPrimary,
        secondary: theme.main.secondary,
        onSecondary: theme.main.onSecondary,
        error: theme.main.error,
        onError: theme.main.onPrimary,
        background: theme.main.background,
        onBackground: theme.main.onBackground,
        surface: theme.main.background,
        onSurface: theme.main.onBackground,
      ),
      scaffoldBackgroundColor: theme.main.background,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: theme.textTheme.headlineMedium,
        actionsIconTheme: IconThemeData(color: theme.main.onBackground),
        iconTheme: IconThemeData(color: theme.main.onBackground),
        elevation: 4,
        foregroundColor: Colors.white,
        backgroundColor: theme.main.background,
        surfaceTintColor: theme.main.background,
        shadowColor: theme.main.futter.withOpacity(0.5),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: theme.main.secondary,
        unselectedItemColor: theme.main.onBackground,
        selectedIconTheme: IconThemeData(color: theme.main.secondary, size: 16),
        unselectedIconTheme: IconThemeData(color: theme.main.onBackground, size: 16),
        showUnselectedLabels: true,
        selectedLabelStyle: theme.c2,
        unselectedLabelStyle: theme.c2,
        type: BottomNavigationBarType.fixed,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );

CupertinoThemeData cupertinoThemeFromAppTheme(AppThemeData theme, Brightness brightness) =>
    MaterialBasedCupertinoThemeData(materialTheme: materialThemeFromAppTheme(theme, brightness)).copyWith(
      scaffoldBackgroundColor: theme.main.background,
    );

class AppThemeData {
  AppThemeData({
    required this.main,
    required this.isDarkMode,
  });

  factory AppThemeData.dark() => AppThemeData(
        main: MainColors.dark(),
        isDarkMode: true,
      );

  factory AppThemeData.light() => AppThemeData(
        main: MainColors.light(),
        isDarkMode: false,
      );

  final bool isDarkMode;

  final MainColors main;

  TextStyle create({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    double? figmaHeight,
    String? fontFamily,
  }) {
    final height = (figmaHeight ?? fontSize) / fontSize;

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? main.onBackground,
      height: height,
      fontFamily: 'GoThamPro',
    );
  }

  TextStyle get h1 => create(
        fontSize: 32,
        figmaHeight: 38,
        fontWeight: FontWeight.w700,
      );
  TextStyle get h2 => create(
        fontSize: 26,
        figmaHeight: 32,
        fontWeight: FontWeight.w700,
      );
  TextStyle get h3 => create(
        fontSize: 20,
        figmaHeight: 24,
        fontWeight: FontWeight.w700,
      );
  TextStyle get h4 => create(
        fontSize: 16,
        figmaHeight: 24,
        fontWeight: FontWeight.w700,
      );

  TextStyle get t1 => create(
        fontSize: 20,
        figmaHeight: 26,
        fontWeight: FontWeight.bold,
      );
  TextStyle get t2 => create(
        fontSize: 18,
        figmaHeight: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get b1 => create(
        fontSize: 14,
        figmaHeight: 22,
      );

  TextStyle get b2 => create(
        fontSize: 14,
        figmaHeight: 22,
        fontWeight: FontWeight.bold,
      );

  TextStyle get b3 => create(
        fontSize: 16,
        figmaHeight: 24,
        fontWeight: FontWeight.normal,
      );

  TextStyle get b4 => create(
        fontSize: 16,
        figmaHeight: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get b5 => create(
        fontSize: 12,
        figmaHeight: 16,
        fontWeight: FontWeight.w700,
      );

  TextStyle get b6 => create(
        fontSize: 10,
        figmaHeight: 12,
        fontWeight: FontWeight.bold,
      );

  TextStyle get tabs => create(
        fontSize: 10,
        figmaHeight: 12,
      );

  TextStyle get c1 => create(
        fontSize: 14,
        figmaHeight: 22,
        fontWeight: FontWeight.w100,
      );
  TextStyle get c2 => create(
        fontSize: 14,
        figmaHeight: 22,
        fontWeight: FontWeight.bold,
      );

  TextStyle get c3 => create(
        fontSize: 16,
        figmaHeight: 32,
        fontWeight: FontWeight.w400,
      );

  TextStyle get c4 => create(
        fontSize: 16,
        figmaHeight: 32,
        fontWeight: FontWeight.w400,
      );

  TextTheme get textTheme => TextTheme(
        displayLarge: h1,
        displayMedium: h2,
        displaySmall: h3,
        bodyLarge: b1,
        bodyMedium: b1,
        titleMedium: t1,
        titleSmall: t2,
        labelLarge: t1,
        bodySmall: c1,
      );
}
