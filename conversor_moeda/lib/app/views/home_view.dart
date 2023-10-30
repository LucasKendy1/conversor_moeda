// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, use_key_in_widget_constructors

import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();

  HomeController homeController;

  HomeView() {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
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
              items: homeController.currencies,
              onSelected: (model) {
                print(model.name);
              },
              controller: toText,
              selectedItem: homeController.toCurrency.name,
            ),
            SizedBox(
              height: 15,
            ),
            CurrencyBox(
              items: homeController.currencies,
              onSelected: (model) {
                print(model.name);
              },
              controller: fromText,
              selectedItem: homeController.fromCurrency.name,
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("CONVERTER"),
              color: Color(0xFF5fd4af),
            )
          ],
        ),
      ),
    );
  }
}
