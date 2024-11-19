import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mani_uikit/theme/theme.dart';
import 'package:mani_uikit/util/util.dart';
import 'package:mani_uikit/widget/appbar_button.dart';
import 'package:mani_uikit/widget/svg_icon.dart';

class SharedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppbar({
    required this.withBackButton,
    this.button,
    this.title,
    this.onBackButton,
    super.key,
  });

  final bool withBackButton;
  final String? title;
  final Widget? button;
  final VoidCallback? onBackButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: AppDimensions.defaultPadding).r,
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  if (withBackButton)
                    GestureDetector(
                      onTap:onBackButton ??  () => Navigator.of(context).pop(),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: AppDimensions.defaultPadding,
                          right: AppDimensions.verticalStandardGap,
                        ),
                        child: SvgIcon(
                          icon: Assets.icons.arrowLeft,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: AppDimensions.defaultPadding),
                  if (title != null)
                    Flexible(
                      child: AutoSizeText(
                        title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleTextStyle,
                      ),
                    )
                  else
                    SvgIcon(
                      icon: Assets.icons.logo,
                      height: 16,
                      width: 64,
                    ),
                ],
              ),
            ),
            button ?? const AppbarButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
