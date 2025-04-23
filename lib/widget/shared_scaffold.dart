import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mani_uikit/theme/theme.dart';
import 'package:mani_uikit/util/util.dart';
import 'package:mani_uikit/widget/shared_appbar.dart';
import 'package:mani_uikit/widget/svg_icon.dart';

class SharedScaffold extends StatefulWidget {
  const SharedScaffold({
    required this.child,
    this.actionButton,
    this.title,
    super.key,
    this.withBackButton = false,
    this.appBar,
    this.isLoading = false,
    this.padding,
    this.endDrawer,
    this.onBackButton,
    this.backgroundColor,
    this.loadingColor,
  });

  final Widget child;
  final bool withBackButton;
  final bool isLoading;
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? actionButton;
  final EdgeInsets? padding;
  final Widget? endDrawer;
  final VoidCallback? onBackButton;
  final Color? backgroundColor;
  final ColorFilter? loadingColor;

  @override
  State<SharedScaffold> createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends State<SharedScaffold> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    if (widget.isLoading) {
      animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant SharedScaffold oldWidget) {
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        animationController.repeat();
      } else {
        animationController.stop();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          if (widget.backgroundColor != null)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: widget.backgroundColor,
            )
          else ...[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(1.5, -1.5),
                  radius: 1.4,
                  colors: <Color>[
                    const Color(0xFFA4A8FF),
                    const Color(0xffF2F2F5).withOpacity(1),
                  ],
                  stops: const [0, 1],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(2, -0.5),
                  radius: 1.1,
                  colors: [
                    const Color(0xFFFFA4E0),
                    const Color(0xffF2F3F5).withOpacity(0),
                  ],
                  stops: const [0.01, 1],
                ),
              ),
            ),
          ],
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              drawerEdgeDragWidth: Platform.isAndroid ? 0.1.sw : null,
              endDrawer: widget.endDrawer,
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: widget.appBar ??
                  SharedAppbar(
                    onBackButton: widget.onBackButton,
                    withBackButton: widget.withBackButton,
                    title: widget.title,
                    button: widget.actionButton,
                  ),
              body: Padding(
                padding: widget.padding ?? const EdgeInsets.all(AppDimensions.defaultPadding),
                child: widget.child,
              ),
            ),
          ),
          if (widget.isLoading) ...{
            Positioned.fill(
              child: TweenAnimationBuilder<double>(
                builder: (context, value, child) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  );
                },
                tween: Tween(begin: 0, end: 5),
                duration: const Duration(milliseconds: 250),
              ),
            ),
            AnimatedBuilder(
              builder: (context, child) {
                return Transform.rotate(
                  angle: animationController.value * 2 * pi,
                  child: child,
                );
              },
              animation: animationController,
              child: SvgIcon(
                icon: Assets.icons.circleProgress,
		colorFilter: widget.loadingColor,
              ),
            ),
          },
        ],
      );
}
