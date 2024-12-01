class Stock {
  final String symbol;
  final double price;
  final String riskLevel;

  Stock({required this.symbol, required this.price, required this.riskLevel});

  // Factory constructor to create a Stock object from a Map
  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      symbol: map['symbol'],
      price: map['price'],
      riskLevel: map['riskLevel'],
    );
  }
}
