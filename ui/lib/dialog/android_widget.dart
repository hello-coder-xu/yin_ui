import 'package:flutter/material.dart';

import '../animation/fade_in.dart';
import '../animation/scale.dart';
import '../theme/index.dart';
import 'layout_hoc.dart';

final double _padding = boxPadding - 2;

class AndroidWidget extends StatefulWidget {
  //标题
  final dynamic title;

  //内容
  final dynamic message;

  //按钮
  final dynamic buttons;

  //关闭
  final Function onMaskCLick;

  AndroidWidget({
    key,
    this.title,
    this.message,
    this.buttons,
    this.onMaskCLick,
  }) : super(key: key);

  @override
  AndroidWidgetState createState() => new AndroidWidgetState();
}

class AndroidWidgetState extends State<AndroidWidget> {
  final GlobalKey _fadeInKey = GlobalKey();
  final GlobalKey _scaleKey = GlobalKey();
  final double _buttonPadding = 20.0;
  WeTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = WeUI.getTheme(context);
  }

  // 渲染按钮
  Widget _renderButton() {
    final List<Widget> children = [];
    // button高度
    final double footerHeight = 38.0;

    widget.buttons.forEach((it) {
      // 添加
      children.add(InkWell(
        onTap: it['onClick'],
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 70.0),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 17.0,
                    color: widget.buttons.length > 1 && children.length == 0 ? Color(0xff555555) : theme.primaryColor),
                child: it['widget'],
              ),
            ),
          ),
        ),
      ));
    });

    return Padding(
      padding: EdgeInsets.only(right: _buttonPadding, bottom: 12.0, left: _buttonPadding),
      child: SizedBox(
        height: footerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: children,
        ),
      ),
    );
  }

  // 反向执行动画
  reverseAnimation() async {
    (_scaleKey.currentState as ScaleState).controller.reverse();
    await (_fadeInKey.currentState as FadeInState).controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      // 内容
      Padding(
        padding: EdgeInsets.only(left: _padding, right: _padding, bottom: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 16.0, color: Color(0xff808080)),
            child: widget.message,
          ),
        ),
      ),
      // 按钮
      _renderButton()
    ];

    // 标题
    if (widget.title != null) {
      children.insert(
          0,
          Padding(
            padding: EdgeInsets.only(left: boxPadding, right: boxPadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 19.0, color: Colors.black, fontWeight: FontWeight.w500),
                  child: widget.title,
                ),
              ),
            ),
          ));
    }

    return layoutHoc(
      scaleKey: _scaleKey,
      fadeInKey: _fadeInKey,
      maskColor: theme.maskColor,
      children: children,
      onMaskCLick: widget.onMaskCLick,
    );
  }
}
