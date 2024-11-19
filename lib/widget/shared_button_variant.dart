import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mani_uikit/theme/theme.dart';

class SharedButtonVariant extends StatefulWidget {
  const SharedButtonVariant({
    required this.title,
    this.highlight = false,
    this.onTap,
    this.loading = false,
    this.border = false,
    this.height,
    this.textStyle,
    super.key,
  });
  final String title;
  final VoidCallback? onTap;
  final bool loading;
  final bool highlight;
  final bool border;
  final double? height;
  final TextStyle? textStyle;

  @override
  State<SharedButtonVariant> createState() => _SharedButtonVariantState();
}

class _SharedButtonVariantState extends State<SharedButtonVariant>
    with TickerProviderStateMixin {
  late final AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    scaleAnimation = scaleController.drive(
      Tween<double>(begin: 1, end: 0.95),
    );
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Listener(
        onPointerDown: (_) => scaleController.forward(),
        onPointerUp: (_) => scaleController.reverse(),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedBuilder(
            builder: (context, animation) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  height: widget.height ?? AppDimensions.buttonHeight.r,
                  decoration: BoxDecoration(
                    border: widget.border
                        ? Border.all(color: context.colorScheme.borderColor)
                        : null,
                    color: context.colorScheme.cardColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimensions.buttonBorderRadius),
                    ).r,
                  ),
                  alignment: Alignment.center,
                  child: widget.loading
                      ? const CupertinoActivityIndicator()
                      : Text(
                          widget.title,
                          style: widget.textStyle ??
                              context.textTheme.buttonTextStyle.copyWith(
                                color: widget.highlight
                                    ? Colors.orange
                                    : context.colorScheme.primaryTextColor,
                              ),
                        ),
                ),
              );
            },
            animation: scaleAnimation,
          ),
        ),
      );
}
