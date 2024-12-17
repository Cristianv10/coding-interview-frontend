import 'package:coding_interview_frontend/domain/currency_convertion/repositories/currency_repository.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/use_cases/get_conversion_rate.dart';
import 'package:coding_interview_frontend/infrastructure/currency_convertion/data_sources/currency_data_source.dart';
import 'package:coding_interview_frontend/infrastructure/currency_convertion/repository/currency_repository_implementation.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
    var injector = _$Injector();
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureLinkModule();
  }

  void _configureLinkModule() {
    _configureCurrencyConfigurationFactories();
    _configureCurrencyConvertionUseCases();
  }

  // Register factories for data sources and repositories
  @Register.factory(CurrencyDataSource)
  @Register.factory(CurrencyRepository, from: CurrencyRepositoryImplementation)
  void _configureCurrencyConfigurationFactories();

  // Register the use cases
// Aquí registramos los casos de uso
  @Register.factory(GetConversionRate)
  void _configureCurrencyConvertionUseCases();
}
