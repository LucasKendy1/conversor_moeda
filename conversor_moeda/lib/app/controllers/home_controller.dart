// ignore_for_file: avoid_print

import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[3];
  }

  setToCurrency(CurrencyModel toCurrency) {
    this.toCurrency = toCurrency;
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    // switch (fromCurrency.name) {
    //   case "Real":
    //     returnValue = value * toCurrency.real;
    //     break;
    //   case "Dolar":
    //     returnValue = value * toCurrency.dolar;
    //     break;
    //   case "Euro":
    //     returnValue = value * toCurrency.euro;
    //     break;
    //   case "Bitcoin":
    //     returnValue = value * toCurrency.bitcoin;
    //     break;
    //   default:
    //     print("entrada invalida!");
    //     break;
    // }
    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
