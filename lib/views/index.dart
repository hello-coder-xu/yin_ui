import 'package:flutter/material.dart';
import 'package:ui/button/index.dart';
import 'package:ui/toast/index.dart';
import 'package:ui/dialog/index.dart';

///主页
class Index extends StatefulWidget {
  final Function toggleTheme;

  Index(this.toggleTheme);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('test123'),
          WeButton(
            'btn',
            theme: WeButtonType.primary,
            onClick: () {
              WeDialog.alert(context)(
                '弹窗内容',
                onConfirm: () {
                  WeToast.info(context)('点击了确认');
                },
                theme:WeDialogTheme.ANDROID,
              );
            },
          ),
          SizedBox(height: 10),
          WeButton(
            'btn',
            theme: WeButtonType.acquiescent,
            onClick: () {
              WeDialog.confirm(context)(
                '弹窗内容',
                onConfirm: () {
                  WeToast.info(context)('点击了确认');
                },
                theme:WeDialogTheme.IOS,
              );
            },
          ),
          SizedBox(height: 10),
          WeButton(
            'btn',
            theme: WeButtonType.warn,
            onClick: () {
              WeToast.success(context)(message: '成功');
            },
          ),
        ],
      ),
    );
  }
}
