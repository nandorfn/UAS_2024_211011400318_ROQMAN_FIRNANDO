import 'package:crypto_ku/models/crypto_models.dart';
import 'package:crypto_ku/providers/crypto_provider.dart';
import 'package:crypto_ku/widgets/crypto_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CryptoProvider>(context, listen: false).fetchCryptoData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Market CryptoKu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF000000),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.5),
            radius: 1,
            colors: [Color(0xff060020), Color(0xFF000000)],
          ),
        ),
        child: Consumer<CryptoProvider>(
          builder: (context, cryptoProvider, _) {
            if (cryptoProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: cryptoProvider.cryptoData?.length,
                itemBuilder: (context, index) {
                  final crypto = cryptoProvider.cryptoData?[index];
                  final percentChange24h = crypto?.percentChange24h;
                  final percentChangeColor = (percentChange24h != null && percentChange24h.startsWith('-')) ? Colors.red : Colors.green;
                  return CryptoCard(crypto: crypto);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
