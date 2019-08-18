import 'package:flutter/material.dart';

///数字标识
class WeBadge extends StatelessWidget {
  final child;
  final Color color;
  final TextStyle textStyle;
  final Border border;
  final EdgeInsetsGeometry padding;
  final bool hollow;

  WeBadge({
    this.child,
    this.color = Colors.red,
    this.textStyle,
    this.border,
    this.padding,
    this.hollow = false,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color boxColor;
    Border boxBorder;
    BorderRadius radius = BorderRadius.all(Radius.circular(50));

    EdgeInsetsGeometry boxPadding = padding ??
        EdgeInsets.only(
          top: 2.0,
          right: 6.0,
          bottom: 2.0,
          left: 6.0,
        );

    if (hollow) {
      textColor = color;
      boxColor = Colors.transparent;
      boxBorder = Border.all(width: 1, color: color);
    } else {
      textColor = Colors.white;
      boxColor = color;
      boxBorder = null;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: radius,
            border: boxBorder,
          ),
          child: Padding(
            padding: boxPadding,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 13,
                color: textColor,
              ),
              child: Text(child, style: textStyle),
            ),
          ),
        ),
      ],
    );
  }
}
