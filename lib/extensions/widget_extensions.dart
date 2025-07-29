import 'package:flutter/material.dart';

/// This file for [widget extension]

extension WidgetPadding on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
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
  }) => Padding(
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

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);
}

extension Clickable on Widget {
  Widget onTap(
    VoidCallback onTap, {
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) => GestureDetector(onTap: onTap, behavior: behavior, child: this);
}

extension WidgetVisibility on Widget {
  Widget visible(
    bool isVisible, {
    Widget replacement = const SizedBox.shrink(),
  }) => Visibility(visible: isVisible, replacement: replacement, child: this);
}

extension WidgetDecorations on Widget {
  Widget withBoxDecoration({
    Color? color,
    BorderRadius? borderRadius,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
  }) => Container(
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
