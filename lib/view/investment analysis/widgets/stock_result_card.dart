import 'package:flutter/material.dart';

class StockResultCard extends StatelessWidget {
  final String symbol;
  final double price;
  final String riskLevel;

  const StockResultCard({super.key, required this.symbol, required this.price, required this.riskLevel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stock Symbol: $symbol', ),
            const SizedBox(height: 8.0),
            Text('Current Price: \$${price.toStringAsFixed(2)}',),
            const SizedBox(height: 8.0),
            Text('Risk Level: $riskLevel', ),
          ],
        ),
      ),
    );
  }
}
