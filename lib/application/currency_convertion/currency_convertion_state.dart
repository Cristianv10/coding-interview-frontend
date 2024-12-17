import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

abstract class CurrencyConversionState {}

class CurrencyConversionInitial extends CurrencyConversionState {
  final ConversionRequest? request;

  CurrencyConversionInitial({this.request});
}

class CurrencyConversionLoading extends CurrencyConversionState {}

class CurrencyConversionLoaded extends CurrencyConversionState {
  final double rate;

  CurrencyConversionLoaded({required this.rate});
}

class CurrencyConversionUpdated extends CurrencyConversionState {
  final ConversionRequest request;

  CurrencyConversionUpdated({required this.request});
}

class CurrencyConversionResult extends CurrencyConversionState {
  final double result;

  CurrencyConversionResult({required this.result});
}

class CurrencyConversionError extends CurrencyConversionState {
  final String message;

  CurrencyConversionError(this.message);
}
