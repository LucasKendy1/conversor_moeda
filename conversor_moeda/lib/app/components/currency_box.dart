// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, recursive_getters

import 'package:conversor_moeda/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatefulWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel) onSelected;
  

  CurrencyBox(
      {super.key,
      required this.items,
      required this.controller,
      required this.onSelected,
      required this.selectedItem});

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  get onSelected => onSelected;

  get items => items;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child:  DropdownButton<CurrencyModel>(
            value: widget.selectedItem,
            items: widget.items.map((CurrencyModel item) {
              return DropdownMenuItem<CurrencyModel>(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: onSelected,
          ),
        ),
        // DropdownMenu<CurrencyModel>(
        //   hintText: "Moeda",
        //   dropdownMenuEntries: [
        //     items.asNameMap(
        //       (e) => DropdownMenuEntry(label: e.name, value: (e)),
        //     ),
        //     onSelected ,
        //   ],
        //   selectedTrailingIcon: onSelected,
        // )),
        SizedBox(
          width: 40,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderSide: BorderSide(strokeAlign: 2)),
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
