import 'dart:math';

import 'package:calcapp/presenter/edge_finder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("EdgeFinder methods return correct values", () {
    final edgeHelper = EdgeFinder();
    expect(
        edgeHelper.minX([
          Point(0.0, 0.0),
          Point(-1.0, -1.0),
          Point(1.0, 1.0),
          Point(-2.0, 2.0)
        ]),
        -2.0);
    expect(
        edgeHelper.maxX([
          Point(0.0, 0.0),
          Point(-1.0, -1.0),
          Point(1.0, 1.0),
          Point(-2.0, 2.0)
        ]),
        1.0);
    expect(
        edgeHelper.minY([
          Point(0.0, 0.0),
          Point(-1.0, -1.0),
          Point(1.0, 1.0),
          Point(-2.0, 2.0)
        ]),
        -1.0);
    expect(
        edgeHelper.maxY([
          Point(0.0, 0.0),
          Point(-1.0, -1.0),
          Point(1.0, 1.0),
          Point(-2.0, 2.0)
        ]),
        2.0);
  });
}
