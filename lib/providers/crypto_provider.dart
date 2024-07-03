import 'package:crypto_ku/models/crypto_models.dart';
import 'package:crypto_ku/services/crypto_api.dart';
import 'package:flutter/cupertino.dart';

class CryptoProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<CryptoData>? _cryptoData;

  List<CryptoData>? get cryptoData => _cryptoData;
  bool get isLoading => _isLoading;

  Future<void> fetchCryptoData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await CryptoAPI.getData();
      _cryptoData = data;
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}