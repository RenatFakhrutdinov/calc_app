import 'package:calcapp/presenter/edge_finder.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:meta/meta.dart';

class GraphWidget extends StatelessWidget {
  final List<Point> points;

  GraphWidget({
    @required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        size: Size.infinite,
        painter: _GraphPainter(
          points: points,
        ),
      ),
    );
  }
}

class _GraphPainter extends CustomPainter {
  final List<Point> points;

  double minX, maxX, minY, maxY, windowWidth, windowHeight;

  _GraphPainter({
    this.points,
  }) : super() {
    assert(points != null && points.length > 0);
    EdgeFinder edgeHelper = EdgeFinder();
    minX = edgeHelper.minX(points);
    maxX = edgeHelper.maxX(points);
    minY = edgeHelper.minY(points);
    maxY = edgeHelper.maxY(points);
    windowWidth = maxX.abs() + minX.abs();
    windowHeight = maxY.abs() + minY.abs();
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset origin = _scalePoint(const Point(0.0, 0.0), size);

    ///draw each axis
    Paint axisPaint = Paint();
    axisPaint.color = Colors.black;
    axisPaint.style = PaintingStyle.stroke;
    axisPaint.strokeWidth = 1;

    ///x axis
    canvas.drawLine(
        Offset(0.0, origin.dy), Offset(size.width, origin.dy), axisPaint);

    ///y axis
    canvas.drawLine(
        Offset(origin.dx, 0.0), Offset(origin.dx, size.height), axisPaint);

    ///draw trace line
    Paint traceLinePaint = Paint();
    traceLinePaint.color = Colors.blueAccent;
    traceLinePaint.strokeWidth = 1;
    traceLinePaint.style = PaintingStyle.fill;

    for (int i = 0; i < points.length; i++) {
      bool isLastPoint = (i + 1) == points.length;
      Offset firstPoint = _scalePoint(points[i], size);
      if (!isLastPoint) {
        Offset secondPoint = _scalePoint(points[i + 1], size);
        canvas.drawLine(
          firstPoint,
          secondPoint,
          traceLinePaint,
        );
      }
    }
  }

  bool shouldRepaint(_GraphPainter oldDelegate) => true;

  Offset _scalePoint(Point p, Size size) {
    double scaledX = (size.width * (p.x - minX)) / (maxX - minX);
    double scaledY = size.height - (size.height * (p.y - minY)) / (maxY - minY);
    return Offset(scaledX, scaledY);
  }
}
