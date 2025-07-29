extension DefaultValue<T> on T? {
  T or(T fallback) => this ?? fallback;
}
