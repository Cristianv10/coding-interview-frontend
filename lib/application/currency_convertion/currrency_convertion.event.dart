import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

abstract class CurrencyConversionEvent {}

class FetchConversionRate extends CurrencyConversionEvent {
  final ConversionRequest request;

  FetchConversionRate(this.request);
}

class UpdateConversionRequest extends CurrencyConversionEvent {
  final String? cryptoCurrencyId;
  final String? fiatCurrencyId;
  final int? type;
  final double? amount;
  final String? amountCurrencyId;
  final bool? isSwapped;

  UpdateConversionRequest({
    this.cryptoCurrencyId,
    this.fiatCurrencyId,
    this.type,
    this.amount,
    this.amountCurrencyId,
    this.isSwapped,
  });
}

class SwapCurrencies extends CurrencyConversionEvent {}
