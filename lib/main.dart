import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 236, 225, 11)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Your BMI"),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text("Enter you weight in Kgs"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text("Enter youHeight in Ft"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text("Enter you height in Inches"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 21,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //BMI Calc*

                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (ift * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iwt / (tM * tM);

                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are Over Weight!";
                          bgColor = Colors.orange[200];
                        } else if (bmi < 18) {
                          msg = "You are Under Weight!";
                          bgColor = Colors.red[200];
                        } else {
                          msg = "You are Healthy";
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all required blanks";
                        });
                      }
                    },
                    child: const Text("CALIBRATE")),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//COmpleted Project