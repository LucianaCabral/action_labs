import 'package:action_labs/features/currencies/presentation/resources/strings_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'features/currencies/core/di/injection.dart';
import 'features/currencies/presentation/bloc/current_exchange_rate_bloc.dart';
import 'features/currencies/presentation/bloc/current_exchange_rate_event.dart';
import 'features/currencies/presentation/bloc/current_exchange_rate_state.dart';
import 'features/currencies/presentation/utils/hide_keyboard.dart';
import 'features/currencies/presentation/widgets/exchange_rate_header.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CurrentExchangeRateBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExchangeRateScreen(),
    );
  }
}

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              ExchangeRateHeader(),
              const SizedBox(height: 8),
              // Currency Code Input
              SizedBox(
                width: double.infinity,
                child: Container(
                  color: const Color(0x00f4f4f4),
                  child: TextField(
                    controller: _currencyController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      labelText: StringPath.labelText,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      floatingLabelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Search Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF07B0FB),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: _isLoading ? null : _searchExchangeRate,
                  child: BlocConsumer<CurrentExchangeRateBloc,
                      CurrentExchangeRateState>(
                    listener: (context, state) {
                      if (state is CurrentExchangeRateLoaded) {
                        setState(() {
                          _isLoading = false;
                          _showResult = true;
                          _enteredCurrency =
                              _currencyController.text.trim().toUpperCase();
                          final formatter = NumberFormat.currency(
                              locale: StringPath.stringLocale,
                              symbol: 'R\$',
                              decimalDigits: 2);
                          _resultController.text =
                              formatter.format(state.exchangeRate.exchangeRate);
                        });
                      } else if (state is CurrentExchangeRateError) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(StringPath.errorConnection)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (_isLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                      return const Text(
                        StringPath.buttonResult,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          height: 30 / 24,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Result Section
              if (_showResult)
                Column(
                  children: [
                    const Divider(color: Colors.grey, thickness: 1),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            StringPath.headerResult,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              height: 28 / 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentDateTime,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '$_enteredCurrency/BRL',
                                style: const TextStyle(
                                  color: Color(0xFF07B0FB),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF07B0FB).withOpacity(0.1),
                          borderRadius: BorderRadius.zero,
                        ),
                        child: TextField(
                          controller: _resultController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF07B0FB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
