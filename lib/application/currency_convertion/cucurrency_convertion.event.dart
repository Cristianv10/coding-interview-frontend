import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

abstract class CurrencyConversionEvent {}

class FetchConversionRate extends CurrencyConversionEvent {
  final ConversionRequest request;

  FetchConversionRate(this.request);
}

class CalculateConversionResult extends CurrencyConversionEvent {
  final double rate;
  final double amount;
  final bool isCryptoToFiat;

  CalculateConversionResult({
    required this.rate,
    required this.amount,
    required this.isCryptoToFiat,
  });
}
