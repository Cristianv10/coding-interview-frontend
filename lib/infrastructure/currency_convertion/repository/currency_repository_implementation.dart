import 'package:coding_interview_frontend/domain/core/models/conversion_rate_model.dart';
import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/repositories/currency_repository.dart';
import 'package:coding_interview_frontend/infrastructure/currency_convertion/data_sources/currency_data_source.dart';
import 'package:either_dart/either.dart';

class CurrencyRepositoryImplementation implements CurrencyRepository {
  final CurrencyDataSource currencyDataSource;

  CurrencyRepositoryImplementation(this.currencyDataSource);

  @override
  Future<Either<String, double>> fetchConversionRate(
      ConversionRequest request) async {
    try {
      final data = await currencyDataSource.fetchConversionRate(request);
      final conversionRate = ConversionRateModel.fromJson(data);
      return Right(conversionRate.fiatToCryptoExchangeRate);
    } catch (e) {
      // Catch any exceptions and return a descriptive error
      return Left('Failed to fetch conversion rate: ${e.toString()}');
    }
  }
}
