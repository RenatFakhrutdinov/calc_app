import 'package:calcapp/res/strings.dart';
import 'package:calcapp/res/warning_strings.dart';

bool fromIsNotEqualTo(num from, num to) {
  if (from == to) {
    WarningStrings.fromEqualTo = Strings.fromCantBeTo;
    return false;
  } else
    WarningStrings.fromEqualTo = '';
  return true;
}
