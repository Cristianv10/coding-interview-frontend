import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion.event.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';
import 'package:coding_interview_frontend/presentation/core/widgets/text_base.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/conversation_detail_item.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_change_card.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_convertion_wrapper.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_input_field.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConversionView extends StatefulWidget {
  const CurrencyConversionView({super.key});

  @override
  State<CurrencyConversionView> createState() => _CurrencyConversionViewState();
}

class _CurrencyConversionViewState extends State<CurrencyConversionView> {
  @override
  void initState() {
    _setInitConversion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CurrencyConvertionWrapper(
      children: Column(
        children: [
          SizedBox(height: 20.h),
          const CurrencyChangeCard(),
          SizedBox(height: 10.h),
          const CurrencyInputField(),
          SizedBox(height: 20.h),
          BlocBuilder<CurrencyConversionBloc, CurrencyConversionState>(
            builder: (context, state) {
              if (state is CurrencyConversionLoading) {
                return _buildLoadingState();
              }
              if (state is CurrencyConversionError) {
                return _buildErrorState();
              }
              if (state is CurrencyConversionLoaded) {
                return _buildLoadedState(state);
              }
              return _buildInitialOrUpdatedState();
            },
          ),
        ],
      ),
    );
  }

  void _setInitConversion() {
    context.read<CurrencyConversionBloc>().add(
          UpdateConversionRequest(
            cryptoCurrencyId: 'TATUM-TRON-USDT',
            fiatCurrencyId: 'VES',
            type: 0,
            amountCurrencyId: 'TATUM-TRON-USDT',
            isSwapped: false,
          ),
        );
  }

  Widget _buildLoadingState() {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: TextBase(
        text: 'Existe un error con la API',
        color: Colors.orange,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildLoadedState(CurrencyConversionLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        _buildConversionDetailItem('Tasa estimada',
            '${state.rate.toStringAsFixed(2)} ${state.currentCurrency}'),
        _buildConversionDetailItem('Recibirás', state.receivedAmountText),
        const _ConversionDetailItem(label: 'Tiempo estimado', value: '10 Min'),
        const SizedBox(height: 20),
        const SubmitButton(isEnabled: true),
      ],
    );
  }

  Widget _buildInitialOrUpdatedState() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        _ConversionDetailItem(label: 'Tasa estimada', value: '0'),
        _ConversionDetailItem(label: 'Recibirás', value: '0'),
        _ConversionDetailItem(label: 'Tiempo estimado', value: '10 Min'),
        SizedBox(height: 20),
        SubmitButton(isEnabled: true),
      ],
    );
  }

  Widget _buildConversionDetailItem(String label, String value) {
    return ConversionDetailItem(
      label: label,
      value: value,
    );
  }
}

class _ConversionDetailItem extends StatelessWidget {
  const _ConversionDetailItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ConversionDetailItem(
      label: label,
      value: value,
    );
  }
}
