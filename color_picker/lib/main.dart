import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Color> _steps = List<Color>();
  List<Color> _stepBack = List<Color>();
  int _MAX_SIZE = 5;
  Color _color = Colors.white;

  void _setRed() {
    if (_steps.length >= _MAX_SIZE) {
      return;
    }

    setState(() {
      _color = Colors.red;
    });
    _steps.add(_color);
  }

  void _setGreen() {
    if (_steps.length >= _MAX_SIZE) {
      return;
    }
    setState(() {
      _color = Colors.green;
    });
    _steps.add(_color);
  }

  void _setBlue() {
    if (_steps.length >= _MAX_SIZE) {
      return;
    }
    setState(() {
      _color = Colors.blue;
    });
    _steps.add(_color);
  }

  void _redo() {
    if (_stepBack.length <= 0) {
      return;
    }
    setState(() {
      _color = _stepBack.first;
    });
    _stepBack.removeAt(0);
  }

  void _undo() {
    if (_steps.length <= 1) {
      return;
    }
    _stepBack.add(_steps.last);
    _steps.removeLast();
    setState(() {
      _color = _steps[_steps.length - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color picker"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _setRed,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 40,
                      height: 40,
                      color: Colors.red,
                    ),
                  ),
                  GestureDetector(
                    onTap: _setGreen,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 40,
                      height: 40,
                      color: Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: _setBlue,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 40,
                      height: 40,
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: _redo,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      child: Text("Redo"),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: _undo,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                      )),
                      child: Text("Undo"),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: _color,
                  border: Border.all(
                    width: 1,
                  )),
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: 120,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
