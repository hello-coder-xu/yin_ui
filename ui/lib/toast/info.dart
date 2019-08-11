import 'package:flutter/material.dart';
import 'package:ui/animation/fade_in.dart';

///信息视图
class InfoWidget extends StatelessWidget {
  // 内容
  final Widget message;

  // 位置
  final String align;

  // 距离
  final double distance;

  InfoWidget(this.message, {this.align, this.distance});

  @override
  Widget build(BuildContext context) {
    Alignment alignment;

    //信息内容
    Widget info = FadeIn(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromRGBO(17, 17, 17, 0.7),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 6.0,
            right: 16.0,
            left: 16.0,
            bottom: 6.0,
          ),
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white, fontSize: 16.0),
            child: message,
          ),
        ),
      ),
    );

    switch (align) {
      case 'top':
        alignment = Alignment.topCenter;
        info = Padding(
          padding: EdgeInsets.only(top: distance),
          child: info,
        );
        break;
      case 'bottom':
        alignment = Alignment.bottomCenter;
        info = Padding(
          padding: EdgeInsets.only(bottom: distance),
          child: info,
        );
        break;
      default:
        alignment = Alignment.center;
        break;
    }

    return Align(
      alignment: alignment,
      child: info,
    );
  }
}
