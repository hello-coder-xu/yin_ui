import 'package:flutter/material.dart';

///缩放
class Scale extends StatefulWidget {
  final Widget child;
  final bool autoPlay;
  final int duration;
  final double begin;
  final double end;

  Scale({
    key,
    this.child,
    this.autoPlay = true,
    this.duration = 150,
    this.begin = 0.0,
    this.end = 1.0,
  }) : super(key: key);

  @override
  ScaleState createState() => ScaleState();
}

class ScaleState extends State<Scale> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    createAnimate();
  }

  //创建动画
  void createAnimate() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    // 内容放大动画
    animation = Tween(begin: widget.begin, end: widget.end).animate(
      //曲线动画
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    //是否自动执行
    if (widget.autoPlay) controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          scale: animation.value,
          child: widget.child,
        );
      },
    );
  }
}
