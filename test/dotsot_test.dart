import 'package:flutter_test/flutter_test.dart';

import 'package:dotsot/dotsot.dart';

void main() {
  test('adds one to input values', () {
    /// Using String
    "This is a log message in String.".dotsot();

    /// Using Variable
    final variableName = "This is a variable";
    variableName.dotsot();
  });
}
