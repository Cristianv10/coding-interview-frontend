import 'package:coding_interview_frontend/application/currency_convertion/cucurrency_convertion.event.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyInputField extends StatefulWidget {
  const CurrencyInputField({
    super.key,
  });

  @override
  State<CurrencyInputField> createState() => _CurrencyInputFieldState();
}

class _CurrencyInputFieldState extends State<CurrencyInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: 'Valor a convertir',
        labelStyle: const TextStyle(color: Colors.orange, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        final amount = double.tryParse(value) ?? 0.0;
        context.read<CurrencyConversionBloc>().add(
              UpdateConversionRequest(amount: amount),
            );
      },
    );
  }
}
