import 'dart:math';

import 'package:calcapp/point_generator/generate_list_of_points.dart';
import 'package:calcapp/point_generator/get_step_value_one_fortieth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getStepValueOneFortieth gets correct value', () {
    expect(getStepValueOneFortieth(0, 40), 1);
    expect(getStepValueOneFortieth(-40, 0), 1);
    expect(getStepValueOneFortieth(-20, 20), 1);
    expect(getStepValueOneFortieth(0, 20), 0.5);
    expect(getStepValueOneFortieth(-20, 0), 0.5);
  });

  test('generateListOfPoints create correct list', () {
    String additionExp = 'x+5';
    String divisionExp = 'x/5';
    expect(generateListOfPoints(additionExp, -5, 5), [
      Point(-5, 0),
      Point(-4.75, 0.25),
      Point(-4.5, 0.5),
      Point(-4.25, 0.75),
      Point(-4.0, 1.0),
      Point(-3.75, 1.25),
      Point(-3.5, 1.5),
      Point(-3.25, 1.75),
      Point(-3.0, 2.0),
      Point(-2.75, 2.25),
      Point(-2.5, 2.5),
      Point(-2.25, 2.75),
      Point(-2.0, 3.0),
      Point(-1.75, 3.25),
      Point(-1.5, 3.5),
      Point(-1.25, 3.75),
      Point(-1.0, 4.0),
      Point(-0.75, 4.25),
      Point(-0.5, 4.5),
      Point(-0.25, 4.75),
      Point(0.0, 5.0),
      Point(0.25, 5.25),
      Point(0.5, 5.5),
      Point(0.75, 5.75),
      Point(1.0, 6.0),
      Point(1.25, 6.25),
      Point(1.5, 6.5),
      Point(1.75, 6.75),
      Point(2.0, 7.0),
      Point(2.25, 7.25),
      Point(2.5, 7.5),
      Point(2.75, 7.75),
      Point(3.0, 8.0),
      Point(3.25, 8.25),
      Point(3.5, 8.5),
      Point(3.75, 8.75),
      Point(4.0, 9.0),
      Point(4.25, 9.25),
      Point(4.5, 9.5),
      Point(4.75, 9.75),
      Point(5.0, 10.0)
    ]);
    expect(generateListOfPoints(divisionExp, -5, 5), [
      Point(-5, -1.0),
      Point(-4.75, -0.95),
      Point(-4.5, -0.9),
      Point(-4.25, -0.85),
      Point(-4.0, -0.8),
      Point(-3.75, -0.75),
      Point(-3.5, -0.7),
      Point(-3.25, -0.65),
      Point(-3.0, -0.6),
      Point(-2.75, -0.55),
      Point(-2.5, -0.5),
      Point(-2.25, -0.45),
      Point(-2.0, -0.4),
      Point(-1.75, -0.35),
      Point(-1.5, -0.3),
      Point(-1.25, -0.25),
      Point(-1.0, -0.2),
      Point(-0.75, -0.15),
      Point(-0.5, -0.1),
      Point(-0.25, -0.05),
      Point(0.0, 0.0),
      Point(0.25, 0.05),
      Point(0.5, 0.1),
      Point(0.75, 0.15),
      Point(1.0, 0.2),
      Point(1.25, 0.25),
      Point(1.5, 0.3),
      Point(1.75, 0.35),
      Point(2.0, 0.4),
      Point(2.25, 0.45),
      Point(2.5, 0.5),
      Point(2.75, 0.55),
      Point(3.0, 0.6),
      Point(3.25, 0.65),
      Point(3.5, 0.7),
      Point(3.75, 0.75),
      Point(4.0, 0.8),
      Point(4.25, 0.85),
      Point(4.5, 0.9),
      Point(4.75, 0.95),
      Point(5.0, 1.0)
    ]);
  });

  test('generateListOfPoints create list with lenght 41', () {
    String additionExp = 'x+5';
    String divisionExp = 'x/3';
    String sqrtExp = 'sqrt(x)';
    expect(generateListOfPoints(additionExp, -5, 5).length, 41);
    expect(generateListOfPoints(divisionExp, -5, 5).length, 41);
    expect(generateListOfPoints(sqrtExp, 0, 10).length, 41);
  });
}
