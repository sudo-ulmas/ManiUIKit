import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mani_uikit/theme/app_color_scheme.dart';
import 'package:mani_uikit/theme/app_theme_data.dart';

class ThemeCubit extends Cubit<AppThemeData> {
  ThemeCubit(super.initialState)
      : _lightTheme = AppThemeData.fromColorScheme(AppColorScheme.light()),
        _darkTheme = AppThemeData.fromColorScheme(AppColorScheme.dark());

  final AppThemeData _lightTheme;
  final AppThemeData _darkTheme;

  void switchThemes() =>
      state == _lightTheme ? emit(_darkTheme) : emit(_lightTheme);

}
