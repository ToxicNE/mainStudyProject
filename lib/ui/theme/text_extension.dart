part of 'theme.dart';

extension TextExtension on TextStyle {}

extension ThemeExt on BuildContext {
  AppThemeData get theme => AppTheme.of(this);
}
