import 'package:calcapp/validators/from_is_not_equal_to.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromIsNotEqualTo works correct', () {
    expect(fromIsNotEqualTo(4, 4), false);
    expect(fromIsNotEqualTo(-4, 4), true);
  });
}
