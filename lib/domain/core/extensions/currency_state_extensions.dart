import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';

extension CurrencyStateExtensions on CurrencyConversionState {
  /// Return if is swapped.
  bool get isSwapped {
    if (this is CurrencyConversionUpdated) {
      return (this as CurrencyConversionUpdated).isSwapped;
    } else if (this is CurrencyConversionLoaded) {
      return (this as CurrencyConversionLoaded).isSwapped;
    }
    return false;
  }

  /// Return the fiat currency id.
  String get fiatCurrencyId {
    if (this is CurrencyConversionUpdated) {
      return (this as CurrencyConversionUpdated).request.fiatCurrencyId;
    } else if (this is CurrencyConversionLoaded) {
      return (this as CurrencyConversionLoaded).request.fiatCurrencyId;
    } else if (this is CurrencyConversionLoading) {
      return (this as CurrencyConversionLoading).request!.fiatCurrencyId;
    }
    return 'VES'; // Valor por defecto.
  }

  /// Return the currency label according to the isSwapped value.
  String get currencyLabel {
    if (this is CurrencyConversionUpdated) {
      return isSwapped
          ? (this as CurrencyConversionUpdated).request.fiatCurrencyId
          : 'USDT';
    } else if (this is CurrencyConversionLoaded) {
      return isSwapped
          ? (this as CurrencyConversionLoaded).request.fiatCurrencyId
          : 'USDT';
    }
    return 'USDT';
  }
}
