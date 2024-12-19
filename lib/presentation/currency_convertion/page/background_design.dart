import 'package:flutter/material.dart';

class BackgroundDesign extends StatelessWidget {
  final double size;
  final Color? color;
  final Offset position;

  const BackgroundDesign({
    super.key,
    required this.size,
    this.color,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      right: position.dx,
      child: CustomPaint(
        size: Size(size, size),
        painter: _InlineOvalPainter(
          color: color ?? Colors.orange,
        ),
      ),
    );
  }
}

class _InlineOvalPainter extends CustomPainter {
  final Color color;

  _InlineOvalPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
