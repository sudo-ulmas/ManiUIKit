import 'package:flutter/widgets.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dashWidth = 1;
    const dashSpace = 2;
    var startX = 0.0;
    final paint = Paint()
      ..color = const Color(0xffE6E7E8)
      ..strokeWidth = 1;
    while (startX < size.width) {
      if (startX + dashWidth + dashSpace >= size.width) {
        dashWidth = 1;
      }
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
      dashWidth = 2;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
