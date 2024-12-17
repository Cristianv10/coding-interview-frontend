import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

abstract class CurrencyConversionState {}

class CurrencyConversionInitial extends CurrencyConversionState {
  final ConversionRequest? request;

  CurrencyConversionInitial({this.request});
}

class CurrencyConversionLoading extends CurrencyConversionState {
  final bool isSwapped;
  final ConversionRequest? request;

  CurrencyConversionLoading({this.isSwapped = false, this.request});
}

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
}

class CurrencyConversionUpdated extends CurrencyConversionState {
  final ConversionRequest request;
  final bool isSwapped;

  CurrencyConversionUpdated({required this.request, required this.isSwapped});
}

class CurrencyConversionError extends CurrencyConversionState {
  final String message;

  CurrencyConversionError(this.message);
}
