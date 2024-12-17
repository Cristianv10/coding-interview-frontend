import 'package:flutter/material.dart';

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
      onTap: isFiat ? onTap : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(assetPath, width: 30, height: 30),
              const SizedBox(width: 8),
              Text(currency, style: const TextStyle(fontSize: 13)),
            ],
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
