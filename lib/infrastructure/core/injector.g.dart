// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCurrencyConfigurationFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => CurrencyDataSource())
      ..registerFactory<CurrencyRepository>((c) =>
          CurrencyRepositoryImplementation(c.resolve<CurrencyDataSource>()));
  }

  @override
  void _configureCurrencyConvertionUseCases() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => GetConversionRate(c.resolve<CurrencyRepository>()))
      ..registerFactory((c) => CalculateConversion());
  }
}
