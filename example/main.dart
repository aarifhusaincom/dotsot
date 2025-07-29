// example/main.dart

import 'package:dotsot/dotsot.dart';

void main() {
  // Simple log using the extension
  'App started'.dotsot();

  // Custom tag
  'Fetching user data...'.dotsot('NETWORK');

  // Error message
  'Something went wrong!'.dotsot('ERROR');

  /// Using Variable
  final variableName = "This is a variable";
  variableName.dotsot();
}
