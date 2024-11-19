import 'package:equatable/equatable.dart';
import 'package:mani_uikit/theme/app_color_scheme.dart';
import 'package:mani_uikit/theme/app_text_theme.dart';

class AppThemeData extends Equatable {
  const AppThemeData({required this.colorScheme, required this.textTheme});

  factory AppThemeData.fromColorScheme(AppColorScheme colorScheme) =>
      AppThemeData(
        colorScheme: colorScheme,
        textTheme: AppTextTheme.fromColorScheme(colorScheme),
      );

  final AppColorScheme colorScheme;
  final AppTextTheme textTheme;

  @override
  List<Object?> get props => [colorScheme, textTheme];
}
