import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/dialog/layout_hoc.dart';
import 'package:ui/theme/index.dart';

final double _titleSize = 18.0;
final double _padding = boxPadding - 2;

///ios弹框视图
class IosWidget extends StatefulWidget {
  final dynamic title;
  final dynamic message;
  final dynamic button;

  IosWidget({
    key,
    this.title,
    this.message,
    this.button,
  }) : super(key: key);

  @override
  _IosWidgetState createState() => _IosWidgetState();
}

class _IosWidgetState extends State<IosWidget> {
  final GlobalKey _fadeInKey = GlobalKey();
  final GlobalKey _scaleKey = GlobalKey();
  final _intervalSize = 1 / MediaQueryData.fromWindow(window).devicePixelRatio;
  WeTheme theme;

  @override
  void initState() {
    super.initState();
    theme = WeUI.getTheme(context);
  }

  //渲染按钮
  _renderButton() {
    final List<Widget> children = [];

    final double footerHeight = 48.0;

    widget.button.forEach((it) {
      if (children.length > 0) {
        children.add(SizedBox(
          width: _intervalSize,
          height: footerHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.defaultBorderColor,
            ),
          ),
        ));

        children.add(
          Expanded(
            child: InkWell(
              onTap: it['onClick'],
              child: Align(
                alignment: Alignment.center,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: _titleSize,
                    color: widget.button.lenght > 1 && children.length == 0
                        ? Color(0xff555555)
                        : theme.primaryColor,
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Padding(
        padding: EdgeInsets.only(left: _padding, right: _padding, bottom: 16.0),
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 16.0),
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
    );
  }
}
