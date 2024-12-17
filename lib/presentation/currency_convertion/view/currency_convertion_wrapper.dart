import 'package:flutter/material.dart';

class CurrencyConvertionWrapper extends StatelessWidget {
  final Widget children;
  const CurrencyConvertionWrapper({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 1,
            )
          ],
        ),
        child: children);
  }
}
