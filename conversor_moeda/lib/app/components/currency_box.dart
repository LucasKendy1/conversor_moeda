// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, recursive_getters, unused_local_variable, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_null_comparison

import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedItem;
  Function(CurrencyModel?)? onChanged;

  CurrencyBox(
      {required this.controller,
      required this.items,
      required this.selectedItem,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: DropdownButton<CurrencyModel>(
            padding: EdgeInsets.only(top: 18),
            borderRadius: BorderRadius.circular(12),
            isExpanded: true,
            dropdownColor: Color(0xFFff9554),
            iconEnabledColor: Color(0xFFff9554),
            iconSize: 35,
            hint: Text("Moeda: "),
            onChanged: onChanged,
            value: (selectedItem == null) ? items[0] : selectedItem,
            items: items
                .map<DropdownMenuItem<CurrencyModel>>(
                    (option) => DropdownMenuItem<CurrencyModel>(
                          value: option,
                          child: Text(option.name),
                        ))
                .toList(),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  // borderSide: BorderSide(strokeAlign: 2),
                  ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFff9554)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
