import 'package:flutter/material.dart';
import 'package:flutter_ui/component/title.dart';
import 'package:ui/button/index.dart';

//按钮
class Button extends StatefulWidget {
  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.only(left: 16, right: 16,bottom: 32),
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

  @override
  void dispose() {
    super.dispose();
  }
}
