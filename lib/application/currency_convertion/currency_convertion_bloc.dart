import 'package:coding_interview_frontend/application/currency_convertion/cucurrency_convertion.event.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/use_cases/get_conversion_rate.dart';
import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';

class CurrencyConversionBloc
    extends Bloc<CurrencyConversionEvent, CurrencyConversionState> {
  final GetConversionRate _getConversionRate;

  CurrencyConversionBloc(this._getConversionRate)
      : super(CurrencyConversionInitial(request: ConversionRequest.empty())) {
    on<UpdateConversionRequest>(_onUpdateConversionRequest);
  }

  /// Event handler for [UpdateConversionRequest]
  Future<void> _onUpdateConversionRequest(UpdateConversionRequest event,
      Emitter<CurrencyConversionState> emit) async {
    final updatedRequest = _buildUpdatedRequest(event);

    emit(CurrencyConversionUpdated(request: updatedRequest));

    if (_validateRequest(updatedRequest, emit)) {
      await _fetchConversionRate(updatedRequest, emit);
    }
  }

  /// Builds an updated request based on the current request and the event.
  ConversionRequest _buildUpdatedRequest(UpdateConversionRequest event) {
    final currentRequest = _getCurrentRequest();
    return currentRequest.copyWith(
      cryptoCurrencyId: event.cryptoCurrencyId,
      fiatCurrencyId: event.fiatCurrencyId,
      type: event.type,
      amount: event.amount,
      amountCurrencyId: event.amountCurrencyId,
    );
  }

  /// Returns the current request based on the current state.
  ConversionRequest _getCurrentRequest() {
    if (state is CurrencyConversionUpdated) {
      return (state as CurrencyConversionUpdated).request;
    } else if (state is CurrencyConversionLoaded) {
      return (state as CurrencyConversionLoaded).request;
    } else if (state is CurrencyConversionInitial) {
      return (state as CurrencyConversionInitial).request!;
    }
    return ConversionRequest.empty();
  }

  /// Validates the request and returns true if the request is valid.
  bool _validateRequest(ConversionRequest request, Emitter emit) {
    try {
      request.validate();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Fetches the conversion rate based on the provided [ConversionRequest].
  Future<void> _fetchConversionRate(
      ConversionRequest request, Emitter emit) async {
    emit(CurrencyConversionLoading());
    final result = await _getConversionRate(request);
    result.fold(
      (failure) => emit(CurrencyConversionError(failure)),
      (rate) {
        final receivedAmount = (rate * request.amount).toStringAsFixed(2);
        emit(CurrencyConversionLoaded(
          rate: rate,
          receivedAmountText: '$receivedAmount ${request.fiatCurrencyId}',
          request: request,
        ));
      },
    );
  }
}
