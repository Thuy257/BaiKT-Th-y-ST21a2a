import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phương Trình Bậc 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Giải phương trình bậc 2',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập a',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập  b',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: cController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập c',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double a = double.parse(aController.text);
                double b = double.parse(bController.text);
                double c = double.parse(cController.text);
                double delta = b * b - 4 * a * c;
                if (delta > 0) {
                  double x1 = (-b + math.sqrt(delta)) / (2 * a);
                  double x2 = (-b - math.sqrt(delta)) / (2 * a);
                  setState(() {
                    result = 'Nghiệm của phương trình là: x1 = $x1, x2 = $x2';
                  });
                } else if (delta == 0) {
                  double x = -b / (2 * a);
                  setState(() {
                    result = 'Nghiệm kép của phương trình là: x = $x';
                  });
                } else {
                  setState(() {
                    result = 'Phương trình không có nghiệm thực.';
                  });
                }
              },
              child: Text('Giải',),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
