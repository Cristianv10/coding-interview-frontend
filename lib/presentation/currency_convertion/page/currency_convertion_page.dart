import 'package:coding_interview_frontend/presentation/currency_convertion/page/background_design.dart';
import 'package:flutter/material.dart';
import 'package:coding_interview_frontend/presentation/core/widgets/layout.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_correction_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConvertionPage extends StatelessWidget {
  const CurrencyConvertionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: Stack(
        children: [
          BackgroundDesign(
            size: 1000.sp,
            position: Offset(-830.w, -200.h),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: SizedBox(
              width: 0.9.sw,
              height: 1.sh,
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
