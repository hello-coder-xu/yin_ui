import 'package:flutter/material.dart';
import 'package:flutter_ui/router/index.dart';
import 'package:flutter_ui/views/index.dart';
import 'package:ui/theme/index.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDefaultTheme = true;

  ///修改主题
  void toggleTheme() {
    isDefaultTheme = !isDefaultTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WeUI(
      weTheme: isDefaultTheme
          ? WeTheme()
          : WeTheme(
              primaryColor: Color(0xff1989fa),
              primaryColorDisabled: Color(0xff5cadff),
              warnColor: Color(0xfffb4343),
              warnColorDisabled: Color(0xfffaa7a3),
            ),
      weConfig: WeConfig(toastSuccessDuration: 5000),
      child: MaterialApp(
        routes: routers,
        home: Index(toggleTheme),
      ),
    );
  }
}
