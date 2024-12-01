import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/stock.dart';
import '../services/stock_api_services.dart';
import '../widgets/stock_input_field.dart';
import '../widgets/stock_result_card.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final TextEditingController _controller = TextEditingController();
  String stockSymbol = '';
  double? currentPrice;
  String riskLevel = '';
  bool isLoading = false;
  final StockApiService _apiService = StockApiService();

  // Function to fetch stock data from API and calculate risk level
  Future<void> fetchStockData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _apiService.fetchStockData(stockSymbol);
      final data = response['Time Series (1min)'];

      if (data != null && data.isNotEmpty) {
        final latestData = data.values.first;
        final price = double.parse(latestData['4. close']);

        // Calculate risk level (this is a simple example, you can expand this)
        final calculatedRiskLevel = price > 200 ? 'High Risk' : 'Low Risk'; // Example calculation

        setState(() {
          currentPrice = price;
          riskLevel = calculatedRiskLevel;
        });
      } else {
        setState(() {
          riskLevel = 'No data available';
        });
      }
    } catch (e) {
      setState(() {
        riskLevel = 'Error fetching data';
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Risk Assessment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StockInputField(
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  stockSymbol = text;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: stockSymbol.isEmpty || isLoading
                  ? null
                  : fetchStockData,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Get Stock Data'),
            ),
            const SizedBox(height: 20),
            if (currentPrice != null && riskLevel.isNotEmpty)
              StockResultCard(
                symbol: stockSymbol,
                price: currentPrice!,
                riskLevel: riskLevel,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.clear();
                  currentPrice = null;
                  riskLevel = '';
                });
              },
              child: const Text('Input Another Symbol'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop(); // Close the app
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
