import 'package:coding_interview_frontend/domain/core/models/fiat_assets.dart';
import 'package:coding_interview_frontend/presentation/core/assets/assets.dart';
import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion.event.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_selector.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/fiat_currency_selection.dart';

class CurrencyChangeCard extends StatefulWidget {
  const CurrencyChangeCard({super.key});

  @override
  State<CurrencyChangeCard> createState() => _CurrencyChangeCardState();
}

class _CurrencyChangeCardState extends State<CurrencyChangeCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyConversionBloc, CurrencyConversionState>(
      builder: (context, state) {
        final fiatCurrencyId = _getFiatCurrencyId(state);
        final isSwapped = _isSwapped(state);
        final fiatCurrencyAsset = FiatAssets.getAsset(fiatCurrencyId);

        return Stack(
          alignment: Alignment.center,
          children: [
            _buildCard(fiatCurrencyId, fiatCurrencyAsset, isSwapped),
            _buildSwapButton(),
            _buildLabel('TENGO', Alignment.topLeft, -35, 40),
            _buildLabel('QUIERO', Alignment.topRight, -35, -30),
          ],
        );
      },
    );
  }

  Widget _buildCard(
      String fiatCurrencyId, String fiatCurrencyAsset, bool isSwapped) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isSwapped
            ? _buildSwappedCurrencies(fiatCurrencyId, fiatCurrencyAsset)
            : _buildNormalCurrencies(fiatCurrencyId, fiatCurrencyAsset),
      ),
    );
  }

  List<Widget> _buildNormalCurrencies(
      String fiatCurrencyId, String fiatCurrencyAsset) {
    return [
      CurrencySelector(
        currency: 'USDT',
        assetPath: Assets.tatum,
        isFiat: false,
        onTap: () {},
      ),
      const SizedBox(width: 20),
      CurrencySelector(
        currency: fiatCurrencyId,
        assetPath: fiatCurrencyAsset,
        isFiat: true,
        onTap: () => _showCurrencySelection(context),
      ),
    ];
  }

  List<Widget> _buildSwappedCurrencies(
      String fiatCurrencyId, String fiatCurrencyAsset) {
    return [
      CurrencySelector(
        currency: fiatCurrencyId,
        assetPath: fiatCurrencyAsset,
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
    ];
  }

  Widget _buildSwapButton() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.orange,
      child: IconButton(
        onPressed: _swapCurrencies,
        icon: const Icon(
          Icons.swap_horiz,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildLabel(
      String text, Alignment alignment, double topOffset, double leftOffset) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: Offset(leftOffset, topOffset),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextBase(
            text: text,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _swapCurrencies() {
    final bloc = context.read<CurrencyConversionBloc>();
    final currentState = bloc.state;

    if (currentState is CurrencyConversionUpdated) {
      bloc.add(UpdateConversionRequest(
        type: currentState.request.type == 0 ? 1 : 0,
      ));
    }
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

  String _getFiatCurrencyId(CurrencyConversionState state) {
    if (state is CurrencyConversionUpdated ||
        state is CurrencyConversionLoaded ||
        state is CurrencyConversionLoading) {
      return (state as dynamic).request.fiatCurrencyId;
    }
    return 'VES';
  }

  bool _isSwapped(CurrencyConversionState state) {
    if (state is CurrencyConversionUpdated) {
      return state.isSwapped;
    } else if (state is CurrencyConversionLoaded) {
      return state.isSwapped;
    } else if (state is CurrencyConversionLoading) {
      return state.isSwapped;
    }
    return false;
  }
}
