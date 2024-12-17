import 'package:coding_interview_frontend/application/core/state_provider.dart/app_state_provider.dart';
import 'package:coding_interview_frontend/infrastructure/core/injector.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/page/currency_convertion_page.dart';
import 'package:flutter/material.dart';

void main() {
  Injector.setup();
  runApp(const CodingInterViewChallenge());
}

class CodingInterViewChallenge extends StatelessWidget {
  const CodingInterViewChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const CurrencyConvertionPage(),
      ),
    );
  }
}
