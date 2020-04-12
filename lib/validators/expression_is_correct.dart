import 'package:calcapp/math_expressions_parser/function_of_x.dart';
import 'package:calcapp/res/strings.dart';
import 'package:calcapp/res/warning_strings.dart';

bool expressionIsCorrect(String mathExpression, num from, num to) {
  if (!mathExpression.contains('x')) {
    WarningStrings.wrongExpression = Strings.needX;
    return false;
  }

  ///this block checks expression for exception of FunctionOfX
  try {
    FunctionOfX functionOfX = FunctionOfX(fromExpression: mathExpression);
    functionOfX(from);
    functionOfX(to);
  } catch (e) {
    WarningStrings.wrongExpression = e.toString();
    return false;
  }

  WarningStrings.wrongExpression = null;
  return true;
}
