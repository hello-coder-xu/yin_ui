import 'package:flutter/material.dart';

///淡入
class FadeIn extends StatefulWidget {
  final Widget child;
  final int duration;
  final listener;
  final autPlay;
  final AnimationController controller;

  FadeIn({
    key,
    this.child,
    this.duration = 250,
    this.listener,
    this.autPlay = true,
    this.controller,
  }) : super(key: key);

  @override
  FadeInState createState() => FadeInState();
}

class FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    createAnimate();
  }

  //创建动画
  void createAnimate() {
    if (widget.controller != null) {
      controller = widget.controller;
    } else {
      controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.duration,
        ),
      );
    }

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() => setState(() {}));

    //判断是否添加监听
    if (widget.listener != null) {
      animation.addStatusListener(widget.listener);
    }

    //判断是否自动播放
    if (widget.autPlay) controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
