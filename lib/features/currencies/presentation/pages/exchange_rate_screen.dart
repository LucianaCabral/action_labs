import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/current_exchange_rate_bloc.dart';
import '../bloc/current_exchange_rate_event.dart';
import '../bloc/current_exchange_rate_state.dart';
import '../resources/strings_path.dart';
import '../utils/hide_keyboard.dart';
import '../widgets/currency_input_field.dart';
import '../widgets/exchange_rate_header.dart';
import '../widgets/exchange_result.dart';
import '../widgets/search_button.dart';

class ExchangeRateScreen extends StatefulWidget {
  const ExchangeRateScreen({super.key});

  @override
  _ExchangeRateScreenState createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  bool _isLoading = false;
  bool _showResult = false;
  String _enteredCurrency = '';

  void _searchExchangeRate() {
    if (_currencyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(StringPath.errorConnection)),
      );
      return;
    }

    hideKeyboard(context);

    final fromCurrency = _currencyController.text.trim().toUpperCase();
    BlocProvider.of<CurrentExchangeRateBloc>(context).add(
      LoadCurrentExchangeRate(fromSymbol: fromCurrency, toSymbol: 'BRL'),
    );

    setState(() {
      _isLoading = true;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String currentDateTime =
    DateFormat(StringPath.dateFormat).format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: BlocListener<CurrentExchangeRateBloc, CurrentExchangeRateState>(
            listener: (context, state) {
              if (state is CurrentExchangeRateLoading) {
                setState(() {
                  _isLoading = true;
                });
              } else if (state is CurrentExchangeRateLoaded) {
                setState(() {
                  _isLoading = false;
                  _showResult = true;
                  _enteredCurrency = _currencyController.text.toUpperCase();
                  _resultController.text = NumberFormat.currency(locale:StringPath.stringLocale, symbol: 'R\$').format(state.exchangeRate.exchangeRate);
                });
              } else if (state is CurrentExchangeRateError) {
                setState(() {
                  _isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ExchangeRateHeader(),
                const SizedBox(height: 8),
                CurrencyInputField(controller: _currencyController),
                const SizedBox(height: 24),
                SearchButton(
                  isLoading: _isLoading,
                  onPressed: _searchExchangeRate,
                ),
                const SizedBox(height: 24),
                if (_showResult)
                  ExchangeResult(
                    currentDateTime: currentDateTime,
                    enteredCurrency: _enteredCurrency,
                    resultController: _resultController,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
