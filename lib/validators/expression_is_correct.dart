import 'package:calcapp/res/strings.dart';
import 'package:calcapp/res/warning_strings.dart';

bool expressionIsCorrect(String mathExpression, num from, num to) {
  if (!mathExpression.contains('x')) {
    WarningStrings.wrongExpression = Strings.needX;
    return false;
  }

  WarningStrings.wrongExpression = null;
  return true;
}
//  String test() {
//    ///if sqrt && (from<0 \\ to<0) { error }
//    ///if /x && from<0 && to >0 {do something}
//    ///check from!=to
//
//    String ttt;
//    try {
//      FunctionOfX f = FunctionOfX(fromExpression: 'sqrt(x)');
//      ttt = f(-1).toString();
//    } catch (e) {
//      return e.toString();
//    }
//
//    if (ttt == "NaN") {
//      return "нанананананан";
//    } else if (ttt == "Infinity") {
//      return 'na nol delit nelsya';
//    } else
//      return ttt;
//  }
