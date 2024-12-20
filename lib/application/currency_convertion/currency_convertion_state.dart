import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

abstract class CurrencyConversionState {}

/// The initial state of the currency conversion
class CurrencyConversionInitial extends CurrencyConversionState {
  final ConversionRequest? request;

  CurrencyConversionInitial({this.request});
}

/// The loading state of the currency conversion
class CurrencyConversionLoading extends CurrencyConversionState {
  final bool isSwapped;
  final ConversionRequest? request;

  CurrencyConversionLoading({this.isSwapped = false, this.request});
}

/// The loaded state of the currency conversion
class CurrencyConversionLoaded extends CurrencyConversionState {
  final double rate;
  final String receivedAmountText;
  final ConversionRequest request;
  final bool isSwapped;

  CurrencyConversionLoaded(
      {required this.rate,
      required this.receivedAmountText,
      required this.request,
      this.isSwapped = false});

  String get currentCurrency => isSwapped ? request.fiatCurrencyId : 'USDT';
}

/// The updated state of the currency conversion
class CurrencyConversionUpdated extends CurrencyConversionState {
  final ConversionRequest request;
  final bool isSwapped;

  CurrencyConversionUpdated({required this.request, required this.isSwapped});
}

/// The error state of the currency conversion
class CurrencyConversionError extends CurrencyConversionState {
  final String message;
  final ConversionRequest request;

  CurrencyConversionError(this.message, this.request);
}
