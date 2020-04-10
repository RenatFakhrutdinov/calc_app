import 'package:flutter/foundation.dart';

import 'node.dart';
import 'string_parser.dart';

class FunctionOfX {
  FunctionOfX({@required String fromExpression}) {
    tree = parseString(
        fromExpression.replaceAll(RegExp(r'[^0-9a-zA-Z_.+\-/*%^()]'), ''), 'x');
  }
  Node tree;

  num call(num x) => tree('x', x);
}
