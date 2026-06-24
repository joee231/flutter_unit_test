import 'package:flutter/material.dart';
import 'tip_calculator_logic.dart';

class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({super.key});

  @override
  State<TipCalculatorScreen> createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  final _amountController = TextEditingController();
  final _logic = TipCalculatorLogic();
  double _tipPercentage = 15.0;
  TipResult? _result;

  void _calculate() {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    setState(() {
      _result = _logic.calculateTip(amount, _tipPercentage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Bill Amount',
                prefixText: '\$',
              ),
              keyboardType: TextInputType.number,
              onChanged: (_) => _calculate(),
            ),
            const SizedBox(height: 20),
            Text('Tip Percentage: ${_tipPercentage.toInt()}%'),
            Slider(
              value: _tipPercentage,
              min: 0,
              max: 30,
              divisions: 6,
              label: '${_tipPercentage.toInt()}%',
              onChanged: (value) {
                setState(() {
                  _tipPercentage = value;
                });
                _calculate();
              },
            ),
            const SizedBox(height: 40),
            if (_result != null) ...[
              Text(
                'Tip Amount: \$${_result!.tipAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Total Amount: \$${_result!.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
