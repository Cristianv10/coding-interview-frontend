import 'package:coding_interview_frontend/application/currency_convertion/cucurrency_convertion.event.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/presentation/core/assets/assets.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_selector.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/fiat_currency_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyChangeCard extends StatefulWidget {
  const CurrencyChangeCard({super.key});

  @override
  State<CurrencyChangeCard> createState() => _CurrencyChangeCardState();
}

class _CurrencyChangeCardState extends State<CurrencyChangeCard> {
  bool isSwapped = false;

  void _swapCurrencies() {
    setState(() {
      isSwapped = !isSwapped;
      context.read<CurrencyConversionBloc>().add(
            UpdateConversionRequest(
              type: isSwapped ? 1 : 0,
            ),
          );
    });
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Lógica para intercambiar posiciones
              if (!isSwapped) ...[
                CurrencySelector(
                  currency: 'USDT',
                  assetPath: Assets.tatum,
                  isFiat: false,
                  onTap: () {},
                ),
                const SizedBox(width: 20),
                CurrencySelector(
                  currency: 'VES',
                  assetPath: Assets.vesCurrency,
                  isFiat: true,
                  onTap: () => _showCurrencySelection(context),
                ),
              ] else ...[
                CurrencySelector(
                  currency: 'VES',
                  assetPath: Assets.vesCurrency,
                  isFiat: true,
                  onTap: () => _showCurrencySelection(context),
                ),
                const SizedBox(width: 20),
                CurrencySelector(
                  currency: 'USDT',
                  assetPath: Assets.tatum,
                  isFiat: false,
                  onTap: () {},
                ),
              ],
            ],
          ),
        ),
        Positioned(
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange,
            child: IconButton(
              onPressed: _swapCurrencies, // Acción de intercambio
              icon: const Icon(
                Icons.swap_horiz,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        Positioned(
          top: -5.5,
          left: 30,
          child: Container(
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'TENGO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
        ),
        Positioned(
          top: -5.5,
          right: 30,
          child: Container(
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'QUIERO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
