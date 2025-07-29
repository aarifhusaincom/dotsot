// example/main.dart

import 'package:dotsot/dotsot.dart';

void main() {
  // Simple log using the extension
  'App started'.log();

  // Custom tag
  'Fetching user data...'.log('NETWORK');

  // Error message
  'Something went wrong!'.log('ERROR');
}
