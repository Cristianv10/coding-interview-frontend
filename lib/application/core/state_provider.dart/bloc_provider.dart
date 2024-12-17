import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/domain/currency_convertion/use_cases/get_conversion_rate.dart';
import 'package:coding_interview_frontend/infrastructure/core/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This is a provider that provides the [CurrencyConvertionCubit] to the widget tree.
/// To inject the [CurrencyConvertionCubit] into the widget tree, wrap the widget tree with this provider.
class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _createCurrencyConvertionBloc(),
        ),
      ],
      child: child,
    );
  }

  /// Creates and resolves the `CurrencyConversionCubit` using the Injector.
  CurrencyConversionBloc _createCurrencyConvertionBloc() {
    final getConversionRate = Injector.resolve<GetConversionRate>();
    return CurrencyConversionBloc(
      getConversionRate,
    );
  }
}
