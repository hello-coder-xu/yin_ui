import 'package:flutter/material.dart';
import 'package:flutter_ui/component/title.dart';
import 'package:ui/button/index.dart';

//按钮
class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
          child: ListView(
            children: <Widget>[
              TitleView('Button', '按钮'),
              ListTile(
                title: Text('正常使用'),
              ),
              WeButton(
                'acquiescent',
                theme: WeButtonType.acquiescent,
              ),
              SizedBox(height: 10),
              WeButton(
                'primary',
                theme: WeButtonType.primary,
              ),
              SizedBox(height: 10),
              WeButton(
                'warn',
                theme: WeButtonType.warn,
              ),
              ListTile(
                title: Text('disabled状态'),
              ),
              WeButton(
                'acquiescent禁用状态',
                theme: WeButtonType.acquiescent,
                disabled: true,
              ),
              SizedBox(height: 10),
              WeButton(
                'primary禁用状态',
                theme: WeButtonType.primary,
                disabled: true,
              ),
              SizedBox(height: 10),
              WeButton(
                'warn禁用状态',
                theme: WeButtonType.warn,
                disabled: true,
              ),
              ListTile(
                title: Text('空心'),
              ),
              WeButton(
                'acquiescent空心',
                theme: WeButtonType.acquiescent,
                hollow: true,
              ),
              SizedBox(height: 10),
              WeButton(
                'primary空心',
                theme: WeButtonType.primary,
                hollow: true,
              ),
              SizedBox(height: 10),
              WeButton(
                'warn空心',
                theme: WeButtonType.warn,
                hollow: true,
              ),
              ListTile(
                title: Text('加载中'),
              ),
              WeButton(
                'acquiescent加载中',
                theme: WeButtonType.acquiescent,
                loading: true,
              ),
              SizedBox(height: 10),
              WeButton(
                'primary加载中',
                theme: WeButtonType.primary,
                loading: true,
              ),
              SizedBox(height: 10),
              WeButton(
                'warn加载中',
                theme: WeButtonType.warn,
                loading: true,
              ),
              ListTile(
                title: Text('自定义样式'),
              ),
              WeButton(
                'custom',
                theme: WeButtonType.custom,
                customTheme: {
                  'backgroundColor': Colors.deepOrangeAccent,
                  'fontColor': Colors.white,
                  'disabledBackgroundColor': Colors.deepPurple,
                  'borderColor': Colors.white,
                  'hollowColor': Colors.black,
                },
              ),
              SizedBox(height: 10),
              WeButton(
                'disabled为true',
                theme: WeButtonType.custom,
                disabled: true,
                customTheme: {
                  'backgroundColor': Colors.deepOrangeAccent,
                  'fontColor': Colors.white,
                  'disabledBackgroundColor': Colors.deepPurple,
                  'borderColor': Colors.white,
                  'hollowColor': Colors.black,
                },
              ),
              SizedBox(height: 10),
              WeButton(
                'hollow为true',
                theme: WeButtonType.custom,
                hollow: true,
                customTheme: {
                  'backgroundColor': Colors.deepOrangeAccent,
                  'fontColor': Colors.white,
                  'disabledBackgroundColor': Colors.deepPurple,
                  'borderColor': Colors.white,
                  'hollowColor': Colors.black,
                },
              ),
              ListTile(
                title: Text('最小显示'),
              ),
              Row(
                children: <Widget>[
                  WeButton(
                    'acquiescent',
                    theme: WeButtonType.acquiescent,
                    size: WeButtonSize.mini,
                  ),
                  SizedBox(width: 10),
                  WeButton(
                    'primary',
                    theme: WeButtonType.primary,
                    size: WeButtonSize.mini,
                  ),
                  SizedBox(width: 10),
                  WeButton(
                    'warn',
                    theme: WeButtonType.warn,
                    size: WeButtonSize.mini,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
