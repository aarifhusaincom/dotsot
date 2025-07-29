extension StringCapitalize on String {
  String get capitalize =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
}

extension TrimAll on String {
  String get removeAllWhiteSpace => replaceAll(RegExp(r'\s+'), '');
}

extension ReverseString on String {
  String get reversed => split('').reversed.join();
}

extension SafeParseInt on String {
  int toInt({int defaultValue = 0}) {
    return int.tryParse(this) ?? defaultValue;
  }
}

extension IsNumeric on String {
  bool get isNumeric => double.tryParse(this) != null;
}

extension DigitsOnly on String {
  String get digitsOnly => replaceAll(RegExp(r'\D'), '');
}

extension RepeatString on String {
  String repeat(int times) => List.filled(times, this).join();
}

extension WordCount on String {
  int countWord(String word) => RegExp('\\b\$word\\b').allMatches(this).length;
}

extension EmailValidation on String {
  bool get isEmail =>
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}\$").hasMatch(this);
}

extension ParseDate on String {
  DateTime? toDate([String format = 'yyyy-MM-dd']) {
    try {
      return DateTime.parse(this);
    } catch (_) {
      return null;
    }
  }
}
