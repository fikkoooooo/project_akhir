import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';
import 'package:intl/intl.dart';

const accessoriesColor = Color(0xffeab56f);

class CurrencyConverterApp extends StatefulWidget {
  const CurrencyConverterApp({Key? key}) : super(key: key);

  @override
  _CurrencyConverterAppState createState() => _CurrencyConverterAppState();
}

class _CurrencyConverterAppState extends State<CurrencyConverterApp> {
  TextEditingController amountController = TextEditingController();
  String selectedFromCurrency = 'USD';
  String selectedToCurrency = 'USD';
  String result = '';
  bool hover = false;

  void convertCurrency() {
    double amount = double.tryParse(amountController.text) ?? 0.0;

    // Konversi mata uang
    final Map<String, double> conversionMap = {
      'USD': 1,
      'EUR': 0.85,
      'GBP': 0.73,
      'JPY': 110.22,
      'CNY': 6.37,
      'IDR': 14337.50,
      'KRW': 1183.43,
      'MYR': 4.13,
      'SGD': 1.34,
    };

    final Map<String, String> mapSymbols = {
      'USD': '\$',
      'EUR': '€',
      'GBP': '£',
      'JPY': '¥',
      'CNY': '¥',
      'IDR': 'Rp',
      'KRW': '₩',
      'MYR': 'RM',
      'SGD': 'S\$',
    };

    var customConversion =
        SimpleCustomProperty(conversionMap, mapSymbols: mapSymbols);
    customConversion.convert(selectedFromCurrency, amount);

    Unit targetCurrency = customConversion.getUnit(selectedToCurrency);

    // Format hasil donasi dalam format mata uang
    NumberFormat currencyFormat = NumberFormat.currency(
        symbol: targetCurrency.symbol, decimalDigits: 2, locale: 'id_ID');
    String formattedResult = currencyFormat.format(targetCurrency.value);

    setState(() {
      result = '$formattedResult ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "KONVERSI UANG",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 4.0,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/uang.png",
                          height: 75,
                          width: 75,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Masukkan jumlah uang:'),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16.0),
                      Text('Pilih awalan uang:'),
                      DropdownButton<String>(
                        value: selectedFromCurrency,
                        onChanged: (value) {
                          setState(() {
                            selectedFromCurrency = value!;
                          });
                        },
                        items: [
                          'USD',
                          'EUR',
                          'GBP',
                          'JPY',
                          'CNY',
                          'IDR',
                          'KRW',
                          'MYR',
                          'SGD'
                        ].map((currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16.0),
                      Text('Pilih tujuan konversi:'),
                      DropdownButton<String>(
                        value: selectedToCurrency,
                        onChanged: (value) {
                          setState(() {
                            selectedToCurrency = value!;
                          });
                        },
                        items: [
                          'USD',
                          'EUR',
                          'GBP',
                          'JPY',
                          'CNY',
                          'IDR',
                          'KRW',
                          'MYR',
                          'SGD'
                        ].map((currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: convertCurrency,
                          child: Text('Convert'),
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4.0,
                margin: EdgeInsets.all(16.0),
                child: InkWell(
                  onHover: (hovering) {
                    setState(() {
                      hover = hovering;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: hover ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      result.isEmpty ? 'Hasil Konversi' : result,
                      style: TextStyle(
                        color: hover ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
