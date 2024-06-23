import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _result = '';
  double interest = 0.0;
  double prin = 0.0;

  void _calculateSimpleInterest() {
    final double principal = double.tryParse(_principalController.text) ?? 0.0;
    prin = principal;
    final double rate = double.tryParse(_rateController.text) ?? 0.0;
    final double time = double.tryParse(_timeController.text) ?? 0.0;

    if (principal > 0 && rate > 0 && time > 0) {
      interest = (principal * rate * time) / 100;
      setState(() {
        _result = 'Simple Interest: \$${interest.toStringAsFixed(2)}';
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
        child: Center(
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
                  labelText: 'Rate of Interest',
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
              ElevatedButton(
                onPressed: _calculateSimpleInterest,
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
              Text(
                'Ṭotal Amount: \$${interest + prin}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
