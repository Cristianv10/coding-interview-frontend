import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencySelector extends StatelessWidget {
  final String currency;
  final String assetPath;
  final bool isFiat;
  final VoidCallback onTap;

  const CurrencySelector({
    required this.currency,
    required this.assetPath,
    required this.isFiat,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(assetPath, width: 30.w, height: 30.h),
              SizedBox(width: 8.w),
              TextBase(
                text: currency,
                color: const Color.fromARGB(221, 56, 56, 56),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}
