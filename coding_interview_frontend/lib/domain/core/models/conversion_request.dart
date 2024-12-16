// Model to represent a conversion to maintain scalability.

class ConversionRequest {
  final String cryptoCurrencyId;
  final String fiatCurrencyId;
  final int type;
  final double amount;
  final String amountCurrencyId;

  ConversionRequest({
    required this.cryptoCurrencyId,
    required this.fiatCurrencyId,
    required this.type,
    required this.amount,
    required this.amountCurrencyId,
  });

  /// Convert the request to a map of query parameters.
  Map<String, String> toQueryParameters() {
    return {
      'cryptoCurrencyId': cryptoCurrencyId,
      'fiatCurrencyId': fiatCurrencyId,
      'type': type.toString(),
      'amount': amount.toString(),
      'amountCurrencyId': amountCurrencyId,
    };
  }

  /// Validate the request.
  void validate() {
    if (type != 0 && type != 1) {
      throw Exception(
          'Invalid type: must be 0 (Crypto -> Fiat) or 1 (Fiat -> Crypto)');
    }

    if (amount <= 0) {
      throw Exception('Amount must be greater than zero');
    }

    if (cryptoCurrencyId.isEmpty ||
        fiatCurrencyId.isEmpty ||
        amountCurrencyId.isEmpty) {
      throw Exception('Currency IDs cannot be empty');
    }
  }
}
