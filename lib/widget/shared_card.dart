import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mani_uikit/theme/theme.dart';

class SharedCard extends StatelessWidget {
  const SharedCard({required this.child, this.padding, this.margin, this.color, super.key});
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(AppDimensions.cardPadding).r,
      decoration: BoxDecoration(
        color: color ?? context.colorScheme.cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.cardBorderRaius),
        ).r,
      ),
      child: child,
    );
  }
}
