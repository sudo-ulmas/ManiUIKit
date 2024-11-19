import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit(super.state);

  void changeLocale() => state.languageCode == 'uz' ? emit(const Locale('ru')) : emit(const Locale('uz'));
}
