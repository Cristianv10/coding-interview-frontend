abstract class CurrencyConversionState {}

class CurrencyConversionInitial extends CurrencyConversionState {}

class CurrencyConversionLoading extends CurrencyConversionState {}

class CurrencyConversionLoaded extends CurrencyConversionState {
  final double rate;

  CurrencyConversionLoaded({required this.rate});
}

class CurrencyConversionResult extends CurrencyConversionState {
  final double result;

  CurrencyConversionResult({required this.result});
}

class CurrencyConversionError extends CurrencyConversionState {
  final String message;

  CurrencyConversionError(this.message);
}
