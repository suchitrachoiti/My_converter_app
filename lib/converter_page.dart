import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final TextEditingController _usdController = TextEditingController();
  double _convertedBDT = 0.0;

  final double _conversionRate = 110.0; // 1 USD = 110 BDT

  void _convertCurrency() {
    final usd = double.tryParse(_usdController.text);
    if (usd != null) {
      setState(() {
        _convertedBDT = usd * _conversionRate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('USD to BDT Converter'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usdController,
              decoration: const InputDecoration(
                labelText: 'Enter amount in USD',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Convert to BDT'),
            ),
            const SizedBox(height: 20),
            Text(
              'Amount in BDT: ${_convertedBDT.toStringAsFixed(2)} ৳',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
