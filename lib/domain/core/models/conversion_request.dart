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

  factory ConversionRequest.empty() => ConversionRequest(
        cryptoCurrencyId: '',
        fiatCurrencyId: '',
        type: 0,
        amount: 0.0,
        amountCurrencyId: '',
      );

  ConversionRequest copyWith({
    String? cryptoCurrencyId,
    String? fiatCurrencyId,
    int? type,
    double? amount,
    String? amountCurrencyId,
  }) {
    return ConversionRequest(
      cryptoCurrencyId: cryptoCurrencyId ?? this.cryptoCurrencyId,
      fiatCurrencyId: fiatCurrencyId ?? this.fiatCurrencyId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      amountCurrencyId: amountCurrencyId ?? this.amountCurrencyId,
    );
  }

  Map<String, dynamic> toQueryParameters() {
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

    if (amount <= 1) {
      throw Exception('Amount must be greater than one');
    }

    if (cryptoCurrencyId.isEmpty ||
        fiatCurrencyId.isEmpty ||
        amountCurrencyId.isEmpty) {
      throw Exception('Currency IDs cannot be empty');
    }
  }
}
