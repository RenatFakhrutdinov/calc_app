import 'dart:math';

import 'package:calcapp/helper/edge_finder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("EdgeFinder methods return correct values", () {
    final edgeHelper = EdgeFinder();
    List<Point<num>> points = [
      Point(0.0, 0.0),
      Point(-1.0, -1.0),
      Point(1.0, 1.0),
      Point(-2.0, 2.0)
    ];

    expect(edgeHelper.minX(points), -2.0);
    expect(edgeHelper.maxX(points), 1.0);
    expect(edgeHelper.minY(points), -1.0);
    expect(edgeHelper.maxY(points), 2.0);
  });
}
