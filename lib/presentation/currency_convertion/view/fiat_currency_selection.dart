import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion.event.dart';
import 'package:coding_interview_frontend/presentation/core/assets/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiatCurrencySelectionView extends StatefulWidget {
  final bool isFiat;

  const FiatCurrencySelectionView({super.key, required this.isFiat});

  @override
  State<FiatCurrencySelectionView> createState() =>
      _FiatCurrencySelectionViewState();
}

class _FiatCurrencySelectionViewState extends State<FiatCurrencySelectionView> {
  String? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          const _DragHandle(),
          SizedBox(height: 15.h),
          _BottomModalTitle(widget: widget),
          const SizedBox(height: 10),
          ..._buildCurrencyItems(),
        ],
      ),
    );
  }

  List<Widget> _buildCurrencyItems() {
    if (widget.isFiat) {
      return [
        _buildCurrencyItem('VES', 'Bolívares (Bs)', Assets.vesCurrency),
        _buildCurrencyItem('COP', 'Pesos Colombianos', Assets.copCurrency),
        _buildCurrencyItem('PEN', 'Soles Peruanos (S/)', Assets.penCurrency),
        _buildCurrencyItem('BRL', 'Real Brasileño (R\$)', Assets.brlCurrency),
      ];
    } else {
      return [
        _buildCurrencyItem('USDT', 'Tether (USDT)', Assets.tatum),
      ];
    }
  }

  Widget _buildCurrencyItem(
      String currencyCode, String currencyName, String assetPath) {
    return ListTile(
      leading: Image.asset(assetPath, width: 25, height: 25),
      title: TextBase(
        text: currencyCode,
        fontWeight: FontWeight.w600,
      ),
      subtitle: TextBase(
        text: currencyName,
        fontSize: 13,
      ),
      trailing: Icon(
        widget.isFiat && _selectedCurrency == currencyCode
            ? Icons.radio_button_checked
            : Icons.radio_button_off,
        color: Colors.black87,
      ),
      onTap: () {
        if (widget.isFiat) {
          setState(() {
            _selectedCurrency = currencyCode;
          });
          context.read<CurrencyConversionBloc>().add(
                UpdateConversionRequest(fiatCurrencyId: currencyCode),
              );
        }
        Navigator.of(context).pop();
      },
    );
  }
}

class _BottomModalTitle extends StatelessWidget {
  const _BottomModalTitle({
    required this.widget,
  });

  final FiatCurrencySelectionView widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.isFiat ? 'FIAT' : 'CRIPTO',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
