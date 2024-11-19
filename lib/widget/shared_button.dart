import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mani_uikit/theme/theme.dart';

class SharedButton extends StatefulWidget {
  const SharedButton({
    required this.title,
    required this.onTap,
    this.accentColor = false,
    this.disabled = false,
    this.height,
    this.padding,
    this.color,
    super.key,
  });
  final String title;
  final bool disabled;
  final bool accentColor;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final Color? color;

  final double? height;

  @override
  State<SharedButton> createState() => _SharedButtonState();
}

class _SharedButtonState extends State<SharedButton>
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
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => scaleController.forward(),
      onPointerUp: (_) => scaleController.reverse(),
      child: GestureDetector(
        onTap: !widget.disabled ? widget.onTap : null,
        child: AnimatedBuilder(
          builder: (context, child) {
            return Transform.scale(
              scale: scaleAnimation.value,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: widget.height ?? AppDimensions.buttonHeight.h,
                padding: widget.padding ??
                    const EdgeInsets.symmetric(
                      horizontal: AppDimensions.horizontalMediumGap,
                      vertical: AppDimensions.verticalMediumGap,
                    ).r,
                decoration: BoxDecoration(
                  color: widget.disabled
                      ? context.colorScheme.disabledButtonColor
                      : widget.color ??
                          (widget.accentColor
                              ? context.colorScheme.primaryAccentColor
                              : context.colorScheme.primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppDimensions.buttonBorderRadius),
                  ).r,
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: context.textTheme.buttonTextStyle.copyWith(
                    color: widget.disabled
                        ? context.colorScheme.secondaryTextColor
                        : null,
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
}
