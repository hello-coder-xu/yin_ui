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
          ListTile(title: Text('正常使用')),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '1',
            ),
          ),
          SizedBox(height: 10),
          ListTile(title: Text('size状态big')),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '这是大样式',
              size: SizeType.big,
            ),
          ),
          SizedBox(height: 10),
          ListTile(title: Text('size状态small')),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '这是小样式',
              size: SizeType.samll,
            ),
          ),
          SizedBox(height: 10),
          ListTile(title: Text('空心')),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: WeBadge(
              child: '这是空心',
              hollow: true,
            ),
          ),
          ListTile(title: Text('自定义内间距')),
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
