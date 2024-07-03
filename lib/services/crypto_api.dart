import 'package:crypto_ku/models/crypto_models.dart';
import 'package:dio/dio.dart';

class CryptoAPI {
  static const String baseUrl = 'https://api.coinlore.net/api/tickers/';

  static Future<List<CryptoData>> getData() async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => status! < 500;
    List<CryptoData> cryptoData = [];

    try {
      final res = await dio.get(baseUrl);
      if (res.statusCode == 200) {
        final List<dynamic> data = res.data['data'];
        cryptoData = data.map((json) => CryptoData.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load crypto data');
      }
    } catch (error) {
      rethrow;
    }
    return cryptoData;
  }
}