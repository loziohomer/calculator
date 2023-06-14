import 'package:flutter/material.dart';

import 'custom_button.dart';

const buttonColor = Color(0xFF132E44);

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        //useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _result = 0;
  String _operator = '';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Calculator'),
    );

    final double availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: availableHeight * 0.2,
            width: double.infinity,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: FittedBox(
              child: Text(
                _output,
                style: const TextStyle(
                  color: buttonColor,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: availableHeight * 0.1,
            child: const Divider(
              color: buttonColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: availableHeight * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '7',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '8',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '9',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: Colors.cyan,
                      buttonText: '/',
                      onButtonPressed: _buttonPressed,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '4',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '5',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '6',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: Colors.cyan,
                      buttonText: 'x',
                      onButtonPressed: _buttonPressed,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '1',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '2',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '3',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: Colors.cyan,
                      buttonText: '-',
                      onButtonPressed: _buttonPressed,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: 'C',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '0',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: buttonColor,
                      buttonText: '.',
                      onButtonPressed: _buttonPressed,
                    ),
                    CustomButton(
                      buttonColor: Colors.cyan,
                      buttonText: '+',
                      onButtonPressed: _buttonPressed,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonColor: Colors.cyan,
                      buttonText: '=',
                      onButtonPressed: _buttonPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _result = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '/') {
        _result = double.parse(_output);
        _operator = buttonText;
        _output = '0';
      } else if (buttonText == '=') {
        double input2 = double.parse(_output);
        if (_operator == '+') {
          _result += input2;
        } else if (_operator == '-') {
          _result -= input2;
        } else if (_operator == 'x') {
          _result *= input2;
        } else if (_operator == '/') {
          _result /= input2;
        }
        _output = _result.toString();
        _operator = '';
      } else if (buttonText == '.') {
        if (!_output.contains('.')) {
          _output += buttonText;
        }
      } else if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    });
  }
}
