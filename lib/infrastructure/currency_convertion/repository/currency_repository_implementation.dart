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
      await currencyDataSource.fetchConversionRate(request);
      // TODO: CORREGIR
      return Right(0.0);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
