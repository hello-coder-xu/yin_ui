import 'package:flutter/material.dart';

///旋转视图
class Rotating extends StatefulWidget {
  final Widget child;

  //持续时间
  final duration;

  final bool clockwise;

  Rotating(this.child, {this.duration = 1200, this.clockwise = true});

  @override
  _RotatingState createState() => _RotatingState();
}

class _RotatingState extends State<Rotating>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    )..repeat();

    if (widget.clockwise) {
      animation = Tween(begin: 0.0, end: 360.0).animate(controller)
        ..addListener(() => setState(() {}));
    } else {
      animation = Tween(begin: 360.0, end: 0.0).animate(controller)
        ..addListener(() => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: (animation.value ~/ 30) * 30.0 * 0.0174533,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
