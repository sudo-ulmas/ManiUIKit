import 'package:flutter/material.dart';
import 'package:mani_uikit/theme/app_color_scheme.dart';
import 'package:mani_uikit/theme/app_text_theme.dart';
import 'package:mani_uikit/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({required super.child, required this.data, super.key});

  final AppThemeData data;

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) =>
      oldWidget.data != data;

  static AppThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme == null) {
      throw Exception('Theme not found in the context');
    }

    return theme.data;
  }
}

extension ThemeContextExtension on BuildContext {
  AppThemeData get theme => AppTheme.of(this);
}

extension TextThemeContextExtension on BuildContext {
  AppTextTheme get textTheme => AppTheme.of(this).textTheme;
}

extension ColorThemeContextExtension on BuildContext {
  AppColorScheme get colorScheme => AppTheme.of(this).colorScheme;
}
