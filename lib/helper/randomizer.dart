import 'dart:math';

import 'package:calcapp/res/strings.dart';

class Randomizer {
  String randomExpression() {
    String expression;
    int randomNumber = 1 + Random().nextInt(5);
    switch (randomNumber) {
      case 1:
        expression = Strings.exp1;
        break;
      case 2:
        expression = Strings.exp2;
        break;
      case 3:
        expression = Strings.exp3;
        break;
      case 4:
        expression = Strings.exp4;
        break;
      case 5:
        expression = Strings.exp5;
        break;
    }
    return expression;
  }
}
