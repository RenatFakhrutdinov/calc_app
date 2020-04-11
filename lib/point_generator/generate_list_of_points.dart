import 'dart:math';

import 'package:calcapp/math_expressions_parser/function_of_x.dart';
import 'package:calcapp/point_generator/get_step_value_one_fortieth.dart';

List<Point> generateListOfPoints(String expression, num from, num to) {
  FunctionOfX functionOfX = FunctionOfX(fromExpression: expression);

  List<Point> list = [];
  num loopStep = getStepValueOneFortieth(from, to);
  for (num n = from; n < to; n = n + loopStep) {
    list.add(Point(n, functionOfX(n)));
  }
  return list;
}
