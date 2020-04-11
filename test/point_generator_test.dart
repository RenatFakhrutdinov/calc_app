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
}
