import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion.event.dart';
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

  /// Handles the update request event
  Future<void> _onUpdateConversionRequest(UpdateConversionRequest event,
      Emitter<CurrencyConversionState> emit) async {
    final updatedRequest = _buildUpdatedRequest(event);
    final bool isSwapped = updatedRequest.type == 1;

    emit(CurrencyConversionUpdated(
        request: updatedRequest, isSwapped: isSwapped));

    if (_isValidRequest(updatedRequest)) {
      await _fetchConversionRate(updatedRequest, emit);
    }
  }

  /// Builds the updated request
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

  /// Gets the current request from the state
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

  /// Validates the request
  bool _isValidRequest(ConversionRequest request) {
    try {
      request.validate();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Fetches conversion rate from the use case
  Future<void> _fetchConversionRate(
      ConversionRequest request, Emitter emit) async {
    emit(CurrencyConversionLoading(
        isSwapped: request.type == 1, request: request));
    final result = await _getConversionRate(request);

    result.fold(
      (failure) => emit(CurrencyConversionError(failure)),
      (rate) {
        final receivedAmount = (request.type == 1)
            ? (request.amount / rate).toStringAsFixed(2) // FIAT a CRYPTO
            : (request.amount * rate).toStringAsFixed(2); // CRYPTO a FIAT

        emit(CurrencyConversionLoaded(
          rate: rate,
          receivedAmountText:
              '$receivedAmount ${request.type == 1 ? request.cryptoCurrencyId : request.fiatCurrencyId}',
          request: request,
          isSwapped: request.type == 1 ? true : false,
        ));
      },
    );
  }
}
