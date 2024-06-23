import 'package:calicutatorapp/caliculator.dart';
import 'package:calicutatorapp/coumpound.dart';
import 'package:calicutatorapp/simple.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => caliculator(),
        '/simple': (context) => SimpleInterest(),
        '/compound': (context) => CompoundInterest(),
      },
    );
  }
}
