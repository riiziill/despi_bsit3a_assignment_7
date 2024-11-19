import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 254, 213, 240)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
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
  int sum = 0;
  int difference = 0;
  int product = 0;
  double quotient = 0.0;

  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController minus1Controller = TextEditingController();
  TextEditingController minus2Controller = TextEditingController();
  TextEditingController multiply1Controller = TextEditingController();
  TextEditingController multiply2Controller = TextEditingController();
  TextEditingController divide1Controller = TextEditingController();
  TextEditingController divide2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Unit 5 Calculator"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
    
              const Text('Addition', style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: add1Controller,
                      decoration:
                          const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Text(" + "),
                  Expanded(
                    child: TextField(
                      controller: add2Controller,
                      decoration:
                          const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('= $sum'),

                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        int firstNum = int.tryParse(add1Controller.text) ?? 0;
                        int secondNum = int.tryParse(add2Controller.text) ?? 0;
                        sum = firstNum + secondNum;
                      });
                    },
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        add1Controller.clear();
                        add2Controller.clear();
                        sum = 0;
                      });
                    },
                    child: const Text("C"),
                  ),
                ],
              ),
              const Text('Subtraction', style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: minus1Controller,
                      decoration:
                          const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Text(" - "),
                  Expanded(
                    child: TextField(
                      controller: minus2Controller,
                      decoration:
                          const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('= $difference'),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        int firstNum = int.tryParse(minus1Controller.text) ?? 0;
                        int secondNum =
                            int.tryParse(minus2Controller.text) ?? 0;
                        difference = firstNum - secondNum;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        minus1Controller.clear();
                        minus2Controller.clear();
                        difference = 0;
                      });
                    },
                    child: const Text("C"),
                  ),
                ],
              ),

              const Text('Multiplication', style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: multiply1Controller,
                      decoration:
                          const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Text(" * "),
                  Expanded(
                    child: TextField(
                      controller: multiply2Controller,
                      decoration:
                          const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('= $product'),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        int firstNum =
                            int.tryParse(multiply1Controller.text) ?? 0;
                        int secondNum =
                            int.tryParse(multiply2Controller.text) ?? 0;
                        product = firstNum * secondNum;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        multiply1Controller.clear();
                        multiply2Controller.clear();
                        product = 0;
                      });
                    },
                    child: const Text("C"),
                  ),
                ],
              ),

              const Text('Division', style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: divide1Controller,
                      decoration:
                          const InputDecoration(labelText: "First Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Text(" / "),
                  Expanded(
                    child: TextField(
                      controller: divide2Controller,
                      decoration:
                          const InputDecoration(labelText: "Second Number"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('= ${quotient.toStringAsFixed(2)}'),
                  IconButton(
                    icon: const Text('/', style: TextStyle(fontSize: 24),),
                    onPressed: () {
                      setState(() {
                        int firstNum =
                            int.tryParse(divide1Controller.text) ?? 0;
                        int secondNum =
                            int.tryParse(divide2Controller.text) ?? 1;
                        quotient =
                            (secondNum != 0) ? firstNum / secondNum : 0.0;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        divide1Controller.clear();
                        divide2Controller.clear();
                        quotient = 0.0;
                      });
                    },
                    child: const Text("C"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
