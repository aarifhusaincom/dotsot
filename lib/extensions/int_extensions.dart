extension ClampInt on int {
  int clampBetween(int min, int max) =>
      this < min ? min : (this > max ? max : this);
}

extension IntCheck on int {
  bool get isEvenNumber => this % 2 == 0;
  bool get isOddNumber => this % 2 != 0;
}
