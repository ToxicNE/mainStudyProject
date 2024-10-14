part of '../theme.dart';

class MainColors {
  // ********** MAIN ***********
  MainColors({
    required this.background,
    required this.onBackground,
    required this.primary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryLight,
    required this.secondaryPressed,
    required this.onSecondary,
    required this.success,
    required this.input,
    required this.onInput,
    required this.onInput2,
    required this.buttons,
    required this.onButtons,
    required this.divider,
    required this.buttons2,
    required this.futter,
    required this.onFutter1,
    required this.onFutter2,
    required this.bonusIcons,
    required this.onBackground2,
    required this.error,
    required this.primaryButtonTextColor,
    required this.shimmerColorBase,
    required this.shimmerColorHighLight,
    required this.shimmerContainer,
    required this.switchActiveTrackColor,
  });

  factory MainColors.light() => MainColors(
        primary: const Color(0xFFE01E3C),  
        primaryHover: const Color(0xFFCE1B36),
        primaryPressed: const Color(0xFFF02847),
        onPrimary: const Color(0xFFB2BAC8),
        bonusIcons: const Color(0xFFFDBA50),
        secondary: const Color(0xFF1378BB),
        secondaryLight: const Color(0xFF289FD8),
        secondaryPressed: const Color(0xFF0082D8),
        onSecondary: const Color(0xFFB2BAC8),
        success: const Color(0xFF52c461),
        input: const Color(0xFFEEF2F8),
        onInput: const Color(0xFF7F8CA3),
        onInput2: const Color(0xFF192038),
        buttons: const Color(0xFFEEF2F8),
        onButtons: const Color(0xFF192038),
        background: const Color(0xFFFFFFFF),
        onBackground: const Color(0xFF192038),
        onBackground2: const Color(0xFF7F8CA3),
        divider: const Color(0xFFEAEBED),
        buttons2: const Color(0xFFEEF2F8),
        futter: const Color(0xFF101426),
        onFutter1: const Color(0xFFEEF2F8),
        onFutter2: const Color(0xFFFFFFFF),
        error: const Color(0xFFE53E3E),
        primaryButtonTextColor: const Color(0xFFFFFFFF),
        shimmerColorBase: const Color.fromRGBO(78, 78, 78, 0.15),
        shimmerColorHighLight: const Color.fromRGBO(78, 78, 78, 0.3),
        shimmerContainer: const Color(0xFFEDEDED),
        switchActiveTrackColor: const Color(0xFFEC1C24),
      );

  factory MainColors.dark() => MainColors(
        primary: const Color(0xFFE01E3C),
        primaryHover: const Color(0xFFCE1B36),
        primaryPressed: const Color(0xFFF02847),
        onPrimary: const Color(0xFFFFFFFF),
        bonusIcons: const Color(0xFFFDBA50),
        secondary: const Color(0xFF1378BB),
        secondaryLight: const Color(0xFF289FD8),
        secondaryPressed: const Color(0xFF0082D8),
        onSecondary: const Color(0xFFFFFFFF),
        success: const Color(0xFF52c461),
        input: const Color(0xFF283047),
        onInput: const Color(0xFFFFFFFF),
        onInput2: const Color(0xFF7F8CA3),
        buttons: const Color(0xFF283047),
        onButtons: const Color(0xFFEEF2F8),
        background: const Color(0xFF1D2334),
        onBackground: const Color(0xFFFFFFFF),
        onBackground2: const Color(0xFFB2BAC8),
        divider: const Color(0xFF2F374E),
        buttons2: const Color(0xFF101426),
        futter: const Color(0xFF101426),
        onFutter1: const Color(0xFFEEF2F8),
        onFutter2: const Color(0xFFFFFFFF),
        error: const Color(0xFFE53E3E),
        primaryButtonTextColor: const Color(0xFFFFFFFF),
        shimmerColorBase: const Color.fromRGBO(78, 78, 78, 0.15),
        shimmerColorHighLight: const Color.fromRGBO(78, 78, 78, 0.3),
        shimmerContainer: const Color(0xFFEDEDED),
        switchActiveTrackColor: const Color(0xFFEC1C24),
      );

  Color primary;
  Color primaryHover;
  Color primaryPressed;
  Color onPrimary;
  Color bonusIcons;
  Color secondary;
  Color secondaryLight;
  Color secondaryPressed;
  Color onSecondary;
  Color success;
  Color input;
  Color onInput;
  Color onInput2;
  Color buttons;
  Color onButtons;
  Color background;
  Color onBackground;
  Color onBackground2;
  Color divider;
  Color buttons2;
  Color futter;
  Color onFutter1;
  Color onFutter2;
  Color error;
  Color primaryButtonTextColor;
  Color shimmerColorBase;
  Color shimmerColorHighLight;
  Color shimmerContainer;
  Color switchActiveTrackColor;
}
