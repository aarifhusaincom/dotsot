import 'dart:developer' as developer;

extension Dotsot on String {
  void log([String name = 'LOG']) {
    developer.log(this, name: name);
  }
}
