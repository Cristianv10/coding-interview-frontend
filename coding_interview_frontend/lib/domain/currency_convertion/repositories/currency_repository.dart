import 'package:coding_interview_frontend/domain/core/models/conversion_request.dart';
import 'package:either_dart/either.dart';

/// Abstract class for the currency repository which needs to be implemented.
abstract class CurrencyRepository {
  Future<Either<String, double>> fetchConversionRate(ConversionRequest request);
}
