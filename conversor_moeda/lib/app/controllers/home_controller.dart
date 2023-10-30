// ignore_for_file: avoid_print

import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    switch (fromCurrency?.name) {
      case "Real":
        returnValue = value * toCurrency!.real;
        break;
      case "Dolar":
        returnValue = value * toCurrency!.dolar;
        break;
      case "Euro":
        returnValue = value * toCurrency!.euro;
        break;
      case "Bitcoin":
        returnValue = value * toCurrency!.bitcoin;
        break;
      default:
        print("entrada invalida!");
        break;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
