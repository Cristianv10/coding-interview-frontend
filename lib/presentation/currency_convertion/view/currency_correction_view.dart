import 'package:coding_interview_frontend/application/currency_convertion/currrency_convertion.event.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_bloc.dart';
import 'package:coding_interview_frontend/application/currency_convertion/currency_convertion_state.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/converstion_detail_item.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_change_card.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_convertion_wrapper.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/currency_input_field.dart';
import 'package:coding_interview_frontend/presentation/currency_convertion/view/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CurrencyChangeCard(),
          const SizedBox(height: 20),
          const CurrencyInputField(),
          BlocBuilder<CurrencyConversionBloc, CurrencyConversionState>(
            builder: (context, state) {
              if (state is CurrencyConversionLoading) {
                return const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.orange,
                  )),
                );
              }
              if (state is CurrencyConversionLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ConversionDetailItem(
                      label: 'Tasa estimada',
                      value:
                          '${state.rate.toStringAsFixed(2)} ${state.isSwapped ? state.request.fiatCurrencyId : state.request.amountCurrencyId}',
                    ),
                    ConversionDetailItem(
                      label: 'Recibirás',
                      value: state.receivedAmountText,
                    ),
                    const ConversionDetailItem(
                      label: 'Tiempo estimado',
                      value: '10 Min',
                    ),
                    const SizedBox(height: 20),
                    const SubmitButton(isEnabled: true),
                  ],
                );
              }
              return const SizedBox.shrink();
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
}
