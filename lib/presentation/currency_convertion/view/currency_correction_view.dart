import 'package:coding_interview_frontend/presentation/currency_convertion/view/converstion_detail_item.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_input_field.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_selector.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/fiat_currency_selection.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:coding_interview_frontend/presentation/core/assets/assets.dart';

class CurrencyConversionView extends StatelessWidget {
  const CurrencyConversionView({super.key});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrencySelector(
            title: 'Tengo',
            currency: 'USDT',
            assetPath: Assets.tatum,
            isFiat: false,
            onTap: () {},
          ),
          const SizedBox(height: 10),
          CurrencySelector(
            title: 'Quiero',
            currency: 'VES',
            assetPath: Assets.vesCurrency,
            isFiat: true,
            onTap: () => _showCurrencySelection(context),
          ),
          const SizedBox(height: 20),
          const CurrencyInputField(),
          const SizedBox(height: 20),
          const ConversionDetailItem(
              label: 'Tasa estimada', value: '25.00 VES'),
          const ConversionDetailItem(label: 'Recibirás', value: '125.00 VES'),
          const ConversionDetailItem(label: 'Tiempo estimado', value: '10 Min'),
          const SizedBox(height: 20),
          const SubmitButton(),
        ],
      ),
    );
  }

  void _showCurrencySelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const FiatCurrencySelectionView(),
    );
  }
}
