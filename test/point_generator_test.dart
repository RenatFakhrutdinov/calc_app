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

//  test('generateListOfPoints create correct list', () {
//    String additionExp = 'x+5';
//    String divisionExp = 'x/3';
//    String sqrtExp = 'sqrt(x)';
//    expect(generateListOfPoints(additionExp, -5, 5), );
//    //expect(actual, matcher)
//    //expect(generateListOfPoints(divisionExp, -5, 5), );
//    //expect(generateListOfPoints(sqrtExp, 0, 10), );
//
//  });

  test('generateListOfPoints create list with lenght 41', () {
    String additionExp = 'x+5';
    String divisionExp = 'x/3';
    String sqrtExp = 'sqrt(x)';
    expect(generateListOfPoints(additionExp, -5, 5).length, 41);
    expect(generateListOfPoints(divisionExp, -5, 5).length, 41);
    expect(generateListOfPoints(sqrtExp, 0, 10).length, 41);
  });
}
