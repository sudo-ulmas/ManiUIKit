import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mani_uikit/theme/theme.dart';
import 'package:mani_uikit/util/util.dart';

class AppbarButton extends StatelessWidget {
  const AppbarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LocalizationCubit>(),
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          return GestureDetector(
            onTap: () => context.read<LocalizationCubit>().changeLocale(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.defaultPadding,
                vertical: AppDimensions.verticalRegularGap,
              ),
              decoration: BoxDecoration(
                color: context.colorScheme.cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
              ),
              child: Text(
                locale.languageCode == 'uz' ? 'Русский' : 'English',
                style: context.textTheme.titleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
