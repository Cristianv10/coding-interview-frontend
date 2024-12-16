class CalculateConversion {
  double call({
    required double rate,
    required double amount,
    required bool isCryptoToFiat,
  }) {
    return isCryptoToFiat ? amount * rate : amount / rate;
  }
}
