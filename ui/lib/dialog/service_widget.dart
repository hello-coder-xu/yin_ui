import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/dialog/layout_hoc.dart';
import 'package:ui/theme/index.dart';
import 'package:ui/utils.dart';

import '../animation/fade_in.dart';
import '../animation/scale.dart';

final double _titleSize = 18.0;
final double _padding = boxPadding - 2;

///ios弹框视图
class ServiceWidget extends StatefulWidget {
  //标题
  final dynamic title;

  //内容
  final dynamic message;

  //按钮
  final dynamic buttons;

  //关闭
  final Function onMaskCLick;

  //持续时间
  final int duration;

  //倒计时显示
  final dynamic otherButton;

  ServiceWidget({
    key,
    this.title,
    this.message,
    this.buttons,
    this.onMaskCLick,
    this.duration,
    this.otherButton,
  }) : super(key: key);

  @override
  ServiceWidgetState createState() => ServiceWidgetState();
}

class ServiceWidgetState extends State<ServiceWidget> {
  final GlobalKey _fadeInKey = GlobalKey();
  final GlobalKey _scaleKey = GlobalKey();
  WeTheme theme;
  int duration = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    duration = widget.duration;
    startTime();
  }

  //服务弹框倒计时
  void startTime() {
    if (duration > 0) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        if (duration > 1) {
          duration -= 1;
        } else {
          duration = 0;
          timer.cancel();
          timer = null;
        }
        setState(() {});
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = WeUI.getTheme(context);
  }

  //渲染按钮
  _renderButton() {
    final List<Widget> children = [];

    final double footerHeight = 48.0;

    widget.buttons.forEach((it) {
      if (duration > 0) {
        children.add(
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: theme.defaultBorderColor,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: _titleSize,
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('${duration}s\t'),
                    toTextWidget(widget.otherButton, 'text'),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        children.add(
          Expanded(
            child: InkWell(
              onTap: it['onClick'],
              child: Align(
                alignment: Alignment.center,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: _titleSize,
                    color: widget.buttons.length > 1 && children.length == 0 ? Color(0xff555555) : theme.primaryColor,
                  ),
                  child: it['widget'],
                ),
              ),
            ),
          ),
        );
      }
    });

    return SizedBox(
      height: footerHeight,
      child: Row(
        children: children,
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
      Padding(
        padding: EdgeInsets.only(left: _padding, right: _padding, bottom: 16.0),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xff808080),
          ),
          child: widget.message,
        ),
      ),
      Divider(height: 1, color: theme.defaultBorderColor),
      _renderButton(),
    ];

    if (widget.title != null) {
      children.insert(
        0,
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: _titleSize,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            child: widget.title,
          ),
        ),
      );
    }

    return layoutHoc(
      scaleKey: _scaleKey,
      fadeInKey: _fadeInKey,
      maskColor: theme.maskColor,
      children: children,
      onMaskCLick: widget.onMaskCLick,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }
}
