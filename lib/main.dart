import 'package:coding_interview_frontend/application/core/state_provider.dart/app_state_provider.dart';
import 'package:coding_interview_frontend/infrastructure/core/injector.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/page/currency_convertion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  Injector.setup();
  _initScreenUtil();
  runApp(const CodingInterViewChallenge());
}

Future<void> _initScreenUtil() async {
  await ScreenUtil.ensureScreenSize();
}

class CodingInterViewChallenge extends StatelessWidget {
  const CodingInterViewChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: AppStateProvider(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 115, 181, 234)),
            useMaterial3: true,
          ),
          home: const CurrencyConvertionPage(),
        ),
      ),
    );
  }
}
