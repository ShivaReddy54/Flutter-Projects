import 'package:flutter/material.dart';

class caliculator extends StatefulWidget {
  const caliculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<caliculator> {
  double ans = 0.0;
  String display = "0";
  String? opr;
  double? firstNum;
  double? secondNum;

  double calculate(double firstNum, double secondNum, String opr) {
    switch (opr) {
      case '+':
        return firstNum + secondNum;
      case '-':
        return firstNum - secondNum;
      case '*':
        return firstNum * secondNum;
      case '/':
        return firstNum / secondNum;
      case '%':
        return firstNum % secondNum;
      default:
        return 0.0;
    }
  }

  void calci(String value) {
    setState(() {
      if (value == 'AC') {
        display = "0";
        ans = 0.0;
        firstNum = null;
        secondNum = null;
        opr = null;
      } else if (value == 'C') {
        display = "0";
      } else if (value == '+' ||
          value == '-' ||
          value == '*' ||
          value == '/' ||
          value == '%') {
        if (firstNum == null) {
          firstNum = double.tryParse(display);
          opr = value;
          display = "0";
        } else if (firstNum != null && opr != null) {
          secondNum = double.tryParse(display);
          if (secondNum != null) {
            ans = calculate(firstNum!, secondNum!, opr!);
            display = ans.toString();
            firstNum = ans;
            secondNum = null;
            opr = value;
          }
        }
      } else if (value == '=') {
        if (firstNum != null && opr != null) {
          secondNum = double.tryParse(display);
          if (secondNum != null) {
            ans = calculate(firstNum!, secondNum!, opr!);
            display = ans.toString();
            firstNum = null;
            secondNum = null;
            opr = null;
          }
        }
      } else {
        if (display == "0" && value != ".") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 52, 52),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25, bottom: 8),
                      child: Text(
                        '${display}',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: 380,
                  height: 460,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(
                              value: "AC",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                            Button(
                              value: "%",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                            Button(
                              value: "C",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                            Button(
                              value: "/",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(value: "7", onTap: calci),
                            Button(value: "8", onTap: calci),
                            Button(value: "9", onTap: calci),
                            Button(
                              value: "*",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(value: "4", onTap: calci),
                            Button(value: "5", onTap: calci),
                            Button(value: "6", onTap: calci),
                            Button(
                              value: "-",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(value: "1", onTap: calci),
                            Button(value: "2", onTap: calci),
                            Button(value: "3", onTap: calci),
                            Button(
                              value: "+",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(value: "00", onTap: calci),
                            Button(value: "0", onTap: calci),
                            Button(value: ".", onTap: calci),
                            Button(
                              value: "=",
                              cl: Colors.yellow[900],
                              onTap: calci,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String value;
  final Color? cl;
  final Function(String) onTap;

  const Button({
    super.key,
    required this.value,
    required this.onTap,
    this.cl = const Color.fromARGB(255, 44, 42, 42),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(value);
      },
      child: CircleAvatar(
        radius: 38,
        backgroundColor: cl,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
