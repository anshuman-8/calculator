import 'package:calculator/theme/theme.dart';
import 'package:calculator/theme/theme_manager.dart';
import 'package:calculator/widget/number_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();
// bool a = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

String num1 = "0";
String num2 = '0';
String sym = ' ';

class _CalculatorPageState extends State<CalculatorPage> {
  double calculator(String n1, String n2, String sym) {
    double num1 = double.parse(n1);
    double num2 = double.parse(n2);
    if (sym == '/') {
      if (num2 == 0) {
        return -0;
      }
      return num1 / num2;
    }
    if (sym == 'x') {
      return (num1 * num2) as double;
    }
    if (sym == '-') {
      return (num1 - num2) as double;
    }
    if (sym == '+') {
      return (num1 + num2) as double;
    }
    if (sym == ' ') {
      return 0;
    }
    return -0;
  }

  void displayHandler(String num) {
    var list = ['/', 'x', '+', '-'];
    if (num == 'd') {
      setState(() {
        num1 = "0";
        num2 = '0';
        sym = ' ';
      });
    } else if (num == 'e') {
      setState(() {});
    } else if (list.contains(num)) {
      setState(() {
        sym = num;
      });
    } else if (sym == ' ' && num != 'd') {
      setState(() {
        if (num1 == '0') {
          num1 = num;
        } else {
          num1 = num1 + num;
        }
      });
    } else {
      setState(() {
        if (num2 == '0') {
          num2 = num;
        } else {
          num2 = num2 + num;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var sol = calculator(num1, num2, sym);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (isValue) {
                _themeManager.ToggleTheme(isValue);
              })
          // IconButton(
          //     onPressed: () {
          //       a
          //           ? _themeManager.ToggleTheme(!a)
          //           : _themeManager.ToggleTheme(a);
          //     },
          //     icon: _themeManager.themeMode == ThemeMode.light
          //         ? Icon(Icons.wb_sunny_outlined)
          //         : Icon(Icons.nightlight_round_outlined))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.fromLTRB(55, 15, 5, 10),
              child: Container(
                width: 248,
                child: Text(
                  num1,
                  style: TextStyle(fontSize: 23),
                ),
                height: 55,
                padding: EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Function: ",
                  style: TextStyle(fontSize: 20),
                ),
                Card(
                  child: Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.fromLTRB(22, 11, 15, 10),
                      child: Text(
                        sym,
                        style: const TextStyle(fontSize: 23),
                      )),
                ),
                SizedBox(
                  width: 35,
                ),
                Card(
                  child: Container(
                      width: 145,
                      height: 55,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        num2,
                        style: TextStyle(fontSize: 23),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(children: [
              const Text(
                "Answer: ",
                style: TextStyle(fontSize: 23),
              ),
              Card(
                child: Container(
                  child: Text(
                    sol.toString(),
                    style: const TextStyle(fontSize: 23),
                  ),
                  height: 55,
                  width: 240,
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ]),
            NumberButton(displayHandler)
          ],
        ),
      ),
    );
  }
}
