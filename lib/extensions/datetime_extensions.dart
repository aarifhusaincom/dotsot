extension FormatDate on DateTime {
  String get toDdMmYyyy =>
      '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
}

extension DateCheck on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }
}
