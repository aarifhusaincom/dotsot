extension SafeMap<K, V> on Map<K, V>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
