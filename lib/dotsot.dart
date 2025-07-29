import 'dart:developer' as developer;

extension Dotsot on String {
  void dotsot([String name = 'LOG']) {
    developer.log(this, name: name);
  }
}
