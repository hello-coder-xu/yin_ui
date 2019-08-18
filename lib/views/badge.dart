import 'package:flutter/material.dart';
import 'package:flutter_ui/component/title.dart';
import 'package:ui/badge/index.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TitleView('Badge', '徽章'),
          ListTile(
            title: Text('正常使用'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '1',
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('空心'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '11122',
              hollow: true,
            ),
          ),
          ListTile(
            title: Text('自定义字体'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '8',
              textStyle: TextStyle(fontSize: 8),
              padding: EdgeInsets.only(
                right: 3.0,
                top: 1,
                left: 3.0,
                bottom: 1,
              ),
            ),
          ),
          ListTile(
            title: Text('自定义内间距'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '111',
              padding: EdgeInsets.only(
                top: 2.0,
                right: 10.0,
                bottom: 2.0,
                left: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
