class CryptoData {
  final String id;
  final String symbol;
  final String name;
  final String priceUsd;
  final String percentChange24h;

  CryptoData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.priceUsd,
    required this.percentChange24h,
  });

  factory CryptoData.fromJson(Map<String, dynamic> json) {
    return CryptoData(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      priceUsd: json['price_usd'] as String,
      percentChange24h: json['percent_change_24h'] as String,
    );
  }
}
