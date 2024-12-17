class ConversionRateModel {
  final double fiatToCryptoExchangeRate;

  ConversionRateModel({required this.fiatToCryptoExchangeRate});

  factory ConversionRateModel.fromJson(Map<String, dynamic> json) {
    final rate = json['data']?['byPrice']?['fiatToCryptoExchangeRate'];
    if (rate == null) {
      throw const FormatException(
          'Missing fiatToCryptoExchangeRate in response.');
    }

    final parsedRate = double.tryParse(rate.toString());
    if (parsedRate == null) {
      throw const FormatException('Invalid fiatToCryptoExchangeRate format.');
    }

    return ConversionRateModel(fiatToCryptoExchangeRate: parsedRate);
  }
}
