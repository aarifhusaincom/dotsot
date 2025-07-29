extension SafeList<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension ListDuplicates<T> on List<T> {
  bool get hasDuplicates => length != toSet().length;
}
