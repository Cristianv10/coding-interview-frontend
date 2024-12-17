import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currrency_convertion.event.dart';
import 'package:coding_interview_frontend/presentation/core/assets/assets.dart';

class FiatCurrencySelectionView extends StatefulWidget {
  const FiatCurrencySelectionView({super.key});

  @override
  State<FiatCurrencySelectionView> createState() =>
      _FiatCurrencySelectionViewState();
}

class _FiatCurrencySelectionViewState extends State<FiatCurrencySelectionView> {
  String? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text(
              'FIAT',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          _buildCurrencyItem('VES', 'Bolívares (Bs)', Assets.vesCurrency),
          _buildCurrencyItem('COP', 'Pesos Colombianos', Assets.copCurrency),
          _buildCurrencyItem('PEN', 'Soles Peruanos (S/)', Assets.penCurrency),
          _buildCurrencyItem('BRL', 'Real Brasileño (R\$)', Assets.brlCurrency),
        ],
      ),
    );
  }

  Widget _buildCurrencyItem(
      String currencyCode, String currencyName, String assetPath) {
    return ListTile(
      leading: Image.asset(assetPath, width: 40, height: 40),
      title: TextBase(
        text: currencyCode,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Text(currencyName),
      trailing: Icon(
        _selectedCurrency == currencyCode
            ? Icons.radio_button_checked
            : Icons.radio_button_off,
        color: Colors.orange,
      ),
      onTap: () {
        setState(() {
          _selectedCurrency = currencyCode;
        });
        context.read<CurrencyConversionBloc>().add(
              UpdateConversionRequest(fiatCurrencyId: currencyCode),
            );
        Navigator.of(context).pop();
      },
    );
  }
}
