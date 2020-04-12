import 'package:calcapp/validators/expression_is_correct.dart';
import 'package:calcapp/validators/from_is_not_equal_to.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromIsNotEqualTo works correct', () {
    expect(fromIsNotEqualTo(4, 4), false);
    expect(fromIsNotEqualTo(-4, 4), true);
  });

  test('expressionIsCorrect test works correct', () {
    expect(expressionIsCorrect('x+2', -1, 1), true);
    expect(expressionIsCorrect('x-2', -1, 1), true);
    expect(expressionIsCorrect('2/x', -1, 1), true);
    expect(expressionIsCorrect('x+y', -1, 1), false);
    expect(expressionIsCorrect('4+2', -1, 1), false);
    expect(expressionIsCorrect('x+(2', -1, 1), false);
    expect(expressionIsCorrect('sqrtx', -1, 1), false);
    expect(expressionIsCorrect('sqrt(-3) + x', -1, 1), false);
    expect(expressionIsCorrect('x + 2/0', -1, 1), false);
  });
}
