import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

abstract class CurrencyConversionState {}

class CurrencyConversionInitial extends CurrencyConversionState {
  final ConversionRequest? request;

  CurrencyConversionInitial({this.request});
}

class CurrencyConversionLoading extends CurrencyConversionState {}

class CurrencyConversionLoaded extends CurrencyConversionState {
  final double rate;
  final String receivedAmountText;
  final ConversionRequest request;

  CurrencyConversionLoaded(
      {required this.rate,
      required this.receivedAmountText,
      required this.request});
}

class CurrencyConversionUpdated extends CurrencyConversionState {
  final ConversionRequest request;

  CurrencyConversionUpdated({required this.request});
}

class CurrencyConversionError extends CurrencyConversionState {
  final String message;

  CurrencyConversionError(this.message);
}
