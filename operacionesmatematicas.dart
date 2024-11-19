import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Matemáticas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MathOperationsPage(),
    );
  }
}

class MathOperationsPage extends StatefulWidget {
  @override
  _MathOperationsPageState createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  String _result = '';

  void _findMax() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;
    final num3 = double.tryParse(_num3Controller.text) ?? 0;

    final max = [num1, num2, num3].reduce((a, b) => a > b ? a : b);
    setState(() {
      _result = 'El número mayor es: $max';
    });
  }

  void _findMin() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;
    final num3 = double.tryParse(_num3Controller.text) ?? 0;

    final min = [num1, num2, num3].reduce((a, b) => a < b ? a : b);
    setState(() {
      _result = 'El número menor es: $min';
    });
  }

  void _calculateSquare() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final square = num1 * num1;
    setState(() {
      _result = 'El cuadrado de $num1 es: $square';
    });
  }

  void _calculateCube() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final cube = num1 * num1 * num1;
    setState(() {
      _result = 'El cubo de $num1 es: $cube';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Matemáticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            TextField(
              controller: _num3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 3'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _findMax, child: Text('Número Mayor')),
                ElevatedButton(onPressed: _findMin, child: Text('Número Menor')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: _calculateSquare, child: Text('Cuadrado')),
                ElevatedButton(onPressed: _calculateCube, child: Text('Cubo')),
              ],
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
