import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';

class ConversionDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const ConversionDetailItem(
      {required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextBase(text: label, fontSize: 14),
          TextBase(text: '= $value', fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
