import 'package:flutter/material.dart';
import 'package:mani_uikit/theme/theme.dart';
import 'package:mani_uikit/util/util.dart';
import 'package:mani_uikit/widget/svg_icon.dart';


class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    required this.isChecked,
    this.disabled = false,
    super.key,
  });
  final bool isChecked;
  final bool disabled;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        width: AppDimensions.horizontalMediumGap,
        height: AppDimensions.horizontalMediumGap,
        decoration: BoxDecoration(
          color: disabled
              ? context.colorScheme.primaryColor.withOpacity(0.3)
              : isChecked
                  ? context.colorScheme.primaryColor
                  : context.colorScheme.cardColor,
          shape: BoxShape.circle,
          border: isChecked || disabled
              ? null
              : Border.all(color: context.colorScheme.borderColor, width: 2),
        ),
        child: isChecked || disabled
            ? SvgIcon(
                icon: Assets.icons.check,
                width: AppDimensions.horizontalRegularGap,
                height: AppDimensions.gap,
                fit: BoxFit.none,
              )
            : null,
      );
}
