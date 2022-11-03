import 'package:flutter/material.dart';

class Circleindicator extends Decoration {
  final Color color;
  final double radius;
  const Circleindicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([
    VoidCallback? onChanged,
  ]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // ignore: todo
    // TODO: implement paint
    // ignore: no_leading_underscores_for_local_identifiers
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
