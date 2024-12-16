import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/repositories/currency_repository.dart';
import 'package:either_dart/either.dart';

class GetConversionRate {
  final CurrencyRepository repository;

  GetConversionRate(this.repository);

  /// Fetches the conversion rate based on the provided [ConversionRequest].
  ///
  /// If successful, returns the conversion rate as a [double].
  /// If there is an error, throws an [Exception] with the error message.
  Future<Either<String, double>> call(ConversionRequest request) async {
    // Validate the request parameters before calling the repository.
    request.validate();

    // Fetch the conversion rate using the repository.
    final result = await repository.fetchConversionRate(request);

    // Handle the Either result.
    return result.fold(
      (failure) =>
          throw Exception(failure), // Handle failure by throwing an exception.
      (rate) => Right(rate), // Return the conversion rate on success.
    );
  }
}
