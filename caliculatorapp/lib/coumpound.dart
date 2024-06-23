import 'package:flutter/material.dart';
import 'dart:math';

class CompoundInterest extends StatefulWidget {
  @override
  _CompoundInterestState createState() => _CompoundInterestState();
}

class _CompoundInterestState extends State<CompoundInterest> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _nController = TextEditingController();
  String _result = '';

  void _calculateCompoundInterest() {
    final double principal = double.tryParse(_principalController.text) ?? 0.0;
    final double rate = double.tryParse(_rateController.text) ?? 0.0;
    final double time = double.tryParse(_timeController.text) ?? 0.0;
    final int n = int.tryParse(_nController.text) ?? 0;

    if (principal > 0 && rate > 0 && time > 0 && n > 0) {
      final double amount = principal * pow((1 + rate / (n * 100)), n * time);
      final double interest = amount - principal;
      setState(() {
        _result =
            'Compound Interest: \$${interest.toStringAsFixed(2)}\nTotal Amount: \$${amount.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _result = 'Please enter valid numbers';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Calculator",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Principal Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Rate of Interest (%)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Time Period (years)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of times interest compounded per year',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateCompoundInterest,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
