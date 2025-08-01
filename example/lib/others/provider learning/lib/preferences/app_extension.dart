import 'package:flutter/material.dart';

// extensions.dart
extension StringCapitalize on String {
  String get capitalize =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
}

extension TrimAll on String {
  String get removeAllWhiteSpace => replaceAll(RegExp(r'\s+'), '');
}

extension SafeList<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension ReverseString on String {
  String get reversed => split('').reversed.join();
}

extension BoolToggle on bool {
  bool get toggle => !this;
}

extension IntCheck on int {
  bool get isEvenNumber => this % 2 == 0;
  bool get isOddNumber => this % 2 != 0;
}

extension SafeParseInt on String {
  int toInt({int defaultValue = 0}) {
    return int.tryParse(this) ?? defaultValue;
  }
}

extension FormatDate on DateTime {
  String get toDdMmYyyy =>
      '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
}

extension SafeMap<K, V> on Map<K, V>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
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

extension ClampInt on int {
  int clampBetween(int min, int max) =>
      this < min ? min : (this > max ? max : this);
}

extension ListDuplicates<T> on List<T> {
  bool get hasDuplicates => length != toSet().length;
}

extension WordCount on String {
  int countWord(String word) => RegExp('\\b\$word\\b').allMatches(this).length;
}

extension EmailValidation on String {
  bool get isEmail =>
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}\$").hasMatch(this);
}

extension RoundDouble on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension DateCheck on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }
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

extension DefaultValue<T> on T? {
  T or(T fallback) => this ?? fallback;
}

/// [widget extention] 

import 'package:flutter/material.dart';

extension WidgetPadding on Widget {
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );
}

extension WidgetAlignment on Widget {
  Widget centered() => Center(child: this);

  Widget align(Alignment alignment) =>
      Align(alignment: alignment, child: this);
}

extension Clickable on Widget {
  Widget onTap(VoidCallback onTap, {HitTestBehavior behavior = HitTestBehavior.opaque}) =>
      GestureDetector(
        onTap: onTap,
        behavior: behavior,
        child: this,
      );
}

extension WidgetVisibility on Widget {
  Widget visible(bool isVisible, {Widget replacement = const SizedBox.shrink()}) =>
      Visibility(
        visible: isVisible,
        replacement: replacement,
        child: this,
      );
}

extension WidgetDecorations on Widget {
  Widget withBoxDecoration({
    Color? color,
    BorderRadius? borderRadius,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          border: border,
          boxShadow: boxShadow,
        ),
        child: this,
      );
}

extension WidgetExpanded on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);
}

extension WidgetSized on Widget {
  Widget sized({double? width, double? height}) =>
      SizedBox(width: width, height: height);

  Widget square(double dimension) =>
      SizedBox(width: dimension, height: dimension);
}
