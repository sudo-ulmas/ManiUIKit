import 'package:flutter/widgets.dart';
import 'package:mani_uikit/mani_uikit.dart';

const packageName = 'mani_uikit';

class ImageWrapper extends StatelessWidget {
  const ImageWrapper({
    required this.image,
    this.height,
    this.width,
    this.boxFit,
    super.key,
  });

  final AssetGenImage image;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) => image.image(
        height: height,
        width: width,
        fit: boxFit,
        package: packageName,
      );
}
