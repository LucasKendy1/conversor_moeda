// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, use_key_in_widget_constructors

import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController tt = TextEditingController();
  TextEditingController ft = TextEditingController();
  final String buttonText = "CONVERTER";
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: tt, fromText: ft);
  }

  void chageToCurrencyValue(CurrencyModel? value) {
    setState(() {
      homeController.toCurrency = value!;
    });
  }

  void chageFromCurrencyValue(CurrencyModel? value) {
    setState(() {
      homeController.fromCurrency = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: ListView(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 120,
            ),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              items: homeController.currencies,
              onChanged: (value) {
                chageToCurrencyValue(value);
              },
              controller: tt,
            ),
            SizedBox(
              height: 15,
            ),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              items: homeController.currencies,
              onChanged: (value) {
                chageFromCurrencyValue(value);
              },
              controller: ft,
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                homeController.convert();
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(buttonText,
                    style: TextStyle(color: Colors.black54, fontSize: 20)),
              ),
              color: Color(0xFF5fd4af),
            )
          ],
        ),
      ),
    );
  }
}
