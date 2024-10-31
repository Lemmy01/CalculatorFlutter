import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

enum Operations { add, subtract, multiply, divide }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(400, 525),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setResizable(false);
    await windowManager.setFullScreen(false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
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
  final TextEditingController _controller = TextEditingController();
  double? num1;
  double? num2;
  Operations? operationSelected;
  bool clear = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // TextField on top to display input/output
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.right,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomButton(
                  text: "C",
                  onPressed: () {
                    _controller.clear();
                    num1 = null;
                    num2 = null;
                    clear = false;
                  },
                ),
              ),
            ],
          ),
          // Flexible widget to ensure the grid fills the remaining space
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 4, // 4 buttons in each row
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  CustomButton(
                      text: '1',
                      onPressed: () {
                        normalButtonFunction('1');
                      }),
                  CustomButton(
                      text: '2',
                      onPressed: () {
                        normalButtonFunction('2');
                      }),
                  CustomButton(
                      text: '3',
                      onPressed: () {
                        normalButtonFunction('3');
                      }),
                  CustomButton(
                      text: '+',
                      onPressed: () {
                        if (_controller.text.isNotEmpty && clear == false) {
                          if (num1 == null) {
                            num1 = double.parse(_controller.text);
                            _controller.clear();
                            clear = false;
                          } else {
                            num2 = double.parse(_controller.text);
                            calculate();
                            _controller.text = num1.toString();
                            clear = true;
                          }
                        }
                        operationSelected = Operations.add;
                      }),
                  CustomButton(
                      text: '4',
                      onPressed: () {
                        normalButtonFunction('4');
                      }),
                  CustomButton(
                      text: '5',
                      onPressed: () {
                        normalButtonFunction('5');
                      }),
                  CustomButton(
                      text: '6',
                      onPressed: () {
                        normalButtonFunction('6');
                      }),
                  CustomButton(
                      text: '-',
                      onPressed: () {
                        if (_controller.text.isNotEmpty && clear == false) {
                          if (num1 == null) {
                            num1 = double.parse(_controller.text);
                            _controller.clear();
                            clear = false;
                          } else {
                            num2 = double.parse(_controller.text);
                            calculate();
                            _controller.text = num1.toString();
                            clear = true;
                          }
                        }
                        operationSelected = Operations.subtract;
                      }),
                  CustomButton(
                      text: '7',
                      onPressed: () {
                        normalButtonFunction('7');
                      }),
                  CustomButton(
                      text: '8',
                      onPressed: () {
                        normalButtonFunction('8');
                      }),
                  CustomButton(
                      text: '9',
                      onPressed: () {
                        normalButtonFunction('9');
                      }),
                  CustomButton(
                      text: '*',
                      onPressed: () {
                        if (_controller.text.isNotEmpty && clear == false) {
                          if (num1 == null) {
                            num1 = double.parse(_controller.text);
                            _controller.clear();
                            clear = false;
                          } else {
                            num2 = double.parse(_controller.text);
                            calculate();
                            _controller.text = num1.toString();
                            clear = true;
                          }
                        }
                        operationSelected = Operations.multiply;
                      }),
                  CustomButton(
                      text: '.',
                      onPressed: () {
                        normalButtonFunction('.');
                      }),
                  CustomButton(
                      text: '0',
                      onPressed: () {
                        normalButtonFunction('0');
                      }),
                  CustomButton(
                      text: '=',
                      onPressed: () {
                        if (_controller.text.isNotEmpty && clear == false) {
                          if (num1 == null) {
                            num1 = double.parse(_controller.text);
                            _controller.clear();
                            clear = false;
                          } else if (operationSelected != null) {
                            num2 = double.parse(_controller.text);
                            if (num2 != 0) calculate();
                            _controller.text = num1.toString();
                            clear = true;
                          }
                        }
                        operationSelected = null;
                        num1 = null;
                        num2 = null;
                      }),
                  CustomButton(
                      text: '/',
                      onPressed: () {
                        if (_controller.text.isNotEmpty && clear == false) {
                          if (num1 == null) {
                            num1 = double.parse(_controller.text);
                            _controller.clear();
                            clear = false;
                          } else {
                            num2 = double.parse(_controller.text);
                            if (num2 != 0) calculate();
                            _controller.text = num1.toString();
                            clear = true;
                          }
                        }
                        operationSelected = Operations.divide;
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void normalButtonFunction(String text) {
    if (clear) {
      _controller.clear();
      clear = false;
    }
    _controller.text = '${_controller.text}$text';
  }

  void calculate() {
    if (num2 != null && num1 != null) {
      switch (operationSelected) {
        case Operations.add:
          num1 = num1! + num2!;
          break;
        case Operations.subtract:
          num1 = num1! - num2!;
          break;
        case Operations.multiply:
          num1 = num1! * num2!;
          break;
        case Operations.divide:
          num1 = num1! / num2!;
          break;
        default:
          break;
      }
    }
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
