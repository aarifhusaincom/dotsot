import 'package:dotsot/extensions/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('capitalize the string', () {
    final name = 'aarif husain';
    expect(name.capitalize, 'Aarif husain');
  });
  test('repeat the string', () {
    final name = 'Firoz Ahmed';
    final address = 'Indore';
    expect(name.repeat(2), 'Firoz AhmedFiroz Ahmed');
    expect(address.repeat(2), 'IndoreIndore');
  });
}
