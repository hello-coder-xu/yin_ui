import 'package:flutter/material.dart';
import 'package:flutter_ui/component/title.dart';
import 'package:ui/radio/index.dart';

class RadioPage extends StatefulWidget {
  @override
  RadioPageState createState() => RadioPageState();
}

class RadioPageState extends State<RadioPage> {
  @override
  void initState() {
    super.initState();
  }



  final Widget child = Row(
    children: [
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: WeRadio(
          value: '1',
          child: Text('选项一'),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: WeRadio(
          value: '2',
          child: Text('选项二'),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: WeRadio(
          value: '3',
          child: Text('选项三'),
        ),
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TitleView('Radio', '单选'),
            WeRadioGroup(
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
