import 'package:flutter/material.dart';
import 'package:ui/animation/fade_in.dart';
import 'package:ui/animation/scale.dart';

final double boxPadding = 25.0;

layoutHoc({
  //缩放-key
  @required GlobalKey scaleKey,
  //淡入-key
  @required GlobalKey fadeInKey,
  //显示视图
  @required List<Widget> children,
  //蒙版颜色
  @required Color maskColor,
}) {
  return FadeIn(
    key: fadeInKey,
    duration: 150,
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          left: 0,
          child: DecoratedBox(decoration: BoxDecoration(color: maskColor)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 37.0, right: 37.0),
          child: Scale(
            key: scaleKey,
            begin: 0.85,
            end: 1.0,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Padding(
                padding: EdgeInsets.only(top: boxPadding - 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
