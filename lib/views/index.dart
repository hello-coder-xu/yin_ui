import 'package:flutter/material.dart';
import 'package:ui/button/index.dart';
import 'package:ui/toast/index.dart';

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
              WeToast.info(context)(
                'info',
                align: WeToastInfoAlign.bottom,
              );
            },
          ),
          SizedBox(height: 10),
          WeButton(
            'btn',
            theme: WeButtonType.acquiescent,
            onClick: () {
              var close = WeToast.loading(context)(message: '加载中...');

              Future.delayed(Duration(milliseconds: 2000), () {
                if (close is Function) close();
              });
            },
          ),
          SizedBox(height: 10),
          WeButton(
            'btn',
            theme: WeButtonType.warn,
            onClick: () {
//              WeToast.success(context)(message:'成功');
//              WeToast.fail(context)(message:'失败');
              WeToast.toast(context)(message: '失败', duration: 2000);
            },
          ),
        ],
      ),
    );
  }
}
