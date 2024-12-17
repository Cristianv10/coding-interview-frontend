import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion.event.dart';

class CurrencyInputField extends StatefulWidget {
  const CurrencyInputField({super.key});

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
    return BlocBuilder<CurrencyConversionBloc, CurrencyConversionState>(
      builder: (context, state) {
        final String currencyLabel = _getCurrencyLabel(state);
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              TextBase(
                text: currencyLabel,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  onChanged: (value) {
                    final amount = double.tryParse(value) ?? 0.0;
                    context.read<CurrencyConversionBloc>().add(
                          UpdateConversionRequest(amount: amount),
                        );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getCurrencyLabel(CurrencyConversionState state) {
    if (state is CurrencyConversionUpdated) {
      return !state.isSwapped ? 'USDT' : state.request.fiatCurrencyId;
    } else if (state is CurrencyConversionLoaded) {
      return !state.isSwapped ? 'USDT' : state.request.fiatCurrencyId;
    } else if (state is CurrencyConversionLoading) {
      return !state.isSwapped ? 'USDT' : state.request!.fiatCurrencyId;
    }
    return 'USDT';
  }
}
