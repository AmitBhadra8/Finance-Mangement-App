import 'dart:convert';
import 'package:http/http.dart' as http;

class StockApiService {
  final String apiKey = 'JDDGOMBCIVCG7RGQ';  // Replace with your API key

  // Function to fetch stock data from Alpha Vantage API
  Future<Map<String, dynamic>> fetchStockData(String stockSymbol) async {
    final url =
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$stockSymbol&interval=1min&apikey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load stock data');
    }
  }
}
