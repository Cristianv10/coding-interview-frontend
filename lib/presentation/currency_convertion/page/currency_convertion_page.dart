import 'package:coding_interview_frontend/presentation/currency_convertion/page/background_design.dart';
import 'package:flutter/material.dart';
import 'package:coding_interview_frontend/presentation/core/widgets/layout.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_correction_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConvertionPage extends StatelessWidget {
  const CurrencyConvertionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppLayout(
      children: Stack(
        children: [
          BackgroundCircle(
            size: 1000.sp,
            position: Offset(-830.w, -200.h), // Posición directa aquí
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: SizedBox(
              width: size.width * 0.9,
              height: size.height,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CurrencyConversionView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
