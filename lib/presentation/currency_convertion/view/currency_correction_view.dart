import 'package:coding_interview_frontend/presentation/core/assets/assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CurrencyConversionView extends StatelessWidget {
  const CurrencyConversionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrencySelector('Tengo', 'USDT', Assets.tatum),
          const SizedBox(height: 10),
          _buildCurrencySelector('Quiero', 'VES', Assets.tatum),
          const SizedBox(height: 20),
          _buildInputField(),
          const SizedBox(height: 20),
          _buildConversionDetails(),
          const SizedBox(height: 20),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildCurrencySelector(
      String title, String currency, String assetPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Row(
          children: [
            Image.asset(assetPath, width: 30, height: 30),
            const SizedBox(width: 8),
            Text(currency, style: const TextStyle(fontSize: 16)),
          ],
        ),
        const Icon(Icons.keyboard_arrow_down),
      ],
    );
  }

  Widget _buildInputField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'USDT 5.00',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildConversionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _ConversionDetailItem(label: 'Tasa estimada', value: '25.00 VES'),
        _ConversionDetailItem(label: 'Recibirás', value: '125.00 VES'),
        _ConversionDetailItem(label: 'Tiempo estimado', value: '10 Min'),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Cambiar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _ConversionDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _ConversionDetailItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class FiatCurrencySelectionView extends StatelessWidget {
  const FiatCurrencySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'FIAT',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildCurrencyItem('VES', 'Bolívares (Bs)', Assets.vesCurrency),
        _buildCurrencyItem('COP', 'Pesos Colombianos ', Assets.copCurrency),
        _buildCurrencyItem('PEN', 'Soles Peruanos (S/)', Assets.penCurrency),
        _buildCurrencyItem('BRL', 'Real Brasileño (R\$)', Assets.brlCurrency),
      ],
    );
  }

  Widget _buildCurrencyItem(String title, String subtitle, String assetPath) {
    return ListTile(
      leading: Image.asset(assetPath, width: 40, height: 40),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.radio_button_off),
    );
  }
}

class CryptoCurrencySelectionView extends StatelessWidget {
  const CryptoCurrencySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Cripto',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildCurrencyItem('USDT', 'Tether (USDT)', Assets.tatum),
        _buildCurrencyItem('USDC', 'USD Coin (USDC)', Assets.tatum),
      ],
    );
  }

  Widget _buildCurrencyItem(String title, String subtitle, String assetPath) {
    return ListTile(
      leading: Image.asset(assetPath, width: 40, height: 40),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.radio_button_off),
    );
  }
}
