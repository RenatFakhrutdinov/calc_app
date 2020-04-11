import 'dart:math';

import 'package:calcapp/math_expressions_parser/function_of_x.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FunctionOfX parse addition', () {
    String addition = 'x+1';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), 1);
    expect(functionOfX(half), 1.5);
    expect(functionOfX(negativeNum), -1);
    expect(functionOfX(positiveNum), 3);
  });

  test('FunctionOfX subtraction', () {
    String addition = 'x-1';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), -1);
    expect(functionOfX(half), -0.5);
    expect(functionOfX(negativeNum), -3);
    expect(functionOfX(positiveNum), 1);
  });

  test('FunctionOfX parse multiplication', () {
    String addition = 'x*2';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), 0);
    expect(functionOfX(half), 1);
    expect(functionOfX(negativeNum), -4);
    expect(functionOfX(positiveNum), 4);
  });

  test('FunctionOfX parse division', () {
    String addition = 'x/2';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), 0);
    expect(functionOfX(half), 0.25);
    expect(functionOfX(negativeNum), -1);
    expect(functionOfX(positiveNum), 1);
  });

  test('FunctionOfX parse unary minus', () {
    String addition = '-x';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), 0);
    expect(functionOfX(half), -0.5);
    expect(functionOfX(negativeNum), 2);
    expect(functionOfX(positiveNum), -2);
  });

  test('FunctionOfX parse parenthesis', () {
    String addition = 'x*(2+2)';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), 0);
    expect(functionOfX(half), 2);
    expect(functionOfX(negativeNum), -8);
    expect(functionOfX(positiveNum), 8);
  });

  test('FunctionOfX parse pow', () {
    String addition = 'x^2';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num negativeNum = -2;
    num positiveNum = 2;

    expect(functionOfX(zero), 0);
    expect(functionOfX(half), 0.25);
    expect(functionOfX(negativeNum), 4);
    expect(functionOfX(positiveNum), 4);
  });

  test('FunctionOfX parse sqrt', () {
    String addition = 'sqrt(x)';
    FunctionOfX functionOfX = FunctionOfX(fromExpression: addition);
    num zero = 0;
    num half = 0.5;
    num positiveNum = 2;

    expect(functionOfX(zero), 0);
    expect(functionOfX(half), sqrt(half));
    //expect(functionOfX(negativeNum), sqrt(negativeNum)); we can not use negative number in this case
    expect(functionOfX(positiveNum), sqrt(positiveNum));
  });
}
