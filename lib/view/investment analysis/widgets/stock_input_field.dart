import 'package:flutter/material.dart';

class StockInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const StockInputField({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Enter stock symbol (e.g., AAPL)',
        labelText: 'Stock Symbol',
      ),
      onChanged: onChanged,
    );
  }
}
