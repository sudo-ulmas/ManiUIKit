import 'package:flutter/material.dart';
import 'package:mani_uikit/util/util.dart';
import 'package:mani_uikit/widget/image_wrapper.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.icon,
    super.key,
    this.colorFilter,
    this.width,
    this.height,
    this.fit,
  });
  final ColorFilter? colorFilter;
  final double? width;
  final double? height;
  final SvgGenImage icon;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => icon.svg(
        colorFilter: colorFilter,
        height: height,
        width: width,
        package: packageName,
        fit: fit ?? BoxFit.scaleDown,
      );
}
