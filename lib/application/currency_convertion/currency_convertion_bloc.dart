import 'package:coding_interview_frontend/application/currency_convertion/cucurrency_convertion.event.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/use_cases/get_conversion_rate.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/use_cases/calculate_conversion.dart';

class CurrencyConversionBloc
    extends Bloc<CurrencyConversionEvent, CurrencyConversionState> {
  final GetConversionRate _getConversionRate;
  final CalculateConversion _calculateConversion;

  CurrencyConversionBloc(this._getConversionRate, this._calculateConversion)
      : super(CurrencyConversionInitial()) {
    on<FetchConversionRate>(_onFetchConversionRate);
    on<CalculateConversionResult>(_onCalculateConversionResult);
  }

  Future<void> _onFetchConversionRate(
      FetchConversionRate event, Emitter<CurrencyConversionState> emit) async {
    emit(CurrencyConversionLoading());
    final result = await _getConversionRate(event.request);

    result.fold(
      (failure) => emit(CurrencyConversionError(failure)),
      (rate) => emit(CurrencyConversionLoaded(rate: rate)),
    );
  }

  void _onCalculateConversionResult(
      CalculateConversionResult event, Emitter<CurrencyConversionState> emit) {
    final result = _calculateConversion(
      rate: event.rate,
      amount: event.amount,
      isCryptoToFiat: event.isCryptoToFiat,
    );

    emit(CurrencyConversionResult(result: result));
  }
}
