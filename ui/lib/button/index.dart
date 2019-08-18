import 'package:flutter/material.dart';
import 'package:ui/animation/rotating.dart';
import 'package:ui/icon/index.dart';
import 'package:ui/theme/index.dart';

// 颜色类型
enum WeButtonType { acquiescent, primary, warn, custom }

// 大小类型
enum WeButtonSize { acquiescent, mini }

class WeButton extends StatefulWidget {
  // 内容
  final dynamic child;

  // 禁用
  final bool disabled;

  // 点击回调
  final Function onClick;

  // loading
  final bool loading;

  // 空心
  final bool hollow;

  // 按钮大小类型
  WeButtonSize sizeType;

  // 按钮大小
  Map<String, double> size;

  // 主题
  final WeButtonType theme;

  //圆角
  final double radius;

  //自定义主题
  final Map<String, Color> customTheme;

  // 大小配置
  final List<Map<String, double>> sizeConfig = [
    {'fontSize': 18.0, 'height': 45.0, 'iconSize': 16.0, 'borderSize': 0.5},
    {'fontSize': 13.0, 'height': 30.0, 'iconSize': 14.0, 'borderSize': 0.4}
  ];

  WeButton(
    this.child, {
    this.onClick,
    WeButtonSize size = WeButtonSize.acquiescent,
    this.hollow = false,
    this.theme = WeButtonType.acquiescent,
    this.disabled = false,
    this.loading = false,
    this.radius,
    this.customTheme,
  }) {
    if (theme == WeButtonType.custom && customTheme == null) {
      throw Exception('themeConfig is null');
    }
    if (theme != WeButtonType.custom && customTheme != null) {
      throw Exception('theme is error');
    }

    this.size = sizeConfig[size.index];
    this.sizeType = size;
  }

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<WeButton> {
  //主题
  List<Map<String, Color>> themeConfig;

  // 按钮主题
  Map<String, Color> theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final WeTheme theme = WeUI.getTheme(context);
    themeConfig = [
      //默认模式
      {
        'backgroundColor': theme.defaultBackgroundColor,
        'fontColor': Colors.black,
        'disabledBackgroundColor': Color(0xfff7f7f7),
        'borderColor': theme.defaultBorderColor,
        'hollowColor': Color(0xff353535)
      },
      //主模式
      {
        'backgroundColor': theme.primaryColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.primaryColorDisabled,
        'borderColor': theme.primaryColor,
        'hollowColor': theme.primaryColor
      },
      //警告模式
      {
        'backgroundColor': theme.warnColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.warnColorDisabled,
        'borderColor': theme.warnColor,
        'hollowColor': theme.warnColor
      },
    ];

    if (widget.customTheme != null) {
      themeConfig.add(widget.customTheme);
    }

    final themeConf = themeConfig[widget.theme.index];

    //判断是否空心
    this.theme = widget.hollow
        ? {
            'backgroundColor': Colors.transparent,
            'fontColor': themeConf['hollowColor'],
            'disabledBackgroundColor': null,
            'borderColor': themeConf['hollowColor'],
          }
        : themeConf;
  }

  ///渲染按钮内容
  Widget renderChild(content) {
    // 显示大小
    final size = widget.size;

    //是否禁用状态
    final bool disable = widget.disabled || widget.loading;

    Widget child;
    if (content is String) {
      child = Text(content);
    } else {
      child = content;
    }

    List<Widget> children = [
      DefaultTextStyle(
        style: TextStyle(
          fontSize: size['fontSize'],
          color: theme['fontColor'],
        ),
        child: child,
      ),
    ];

    if (widget.loading) {
      final Widget icon = Padding(
        padding: EdgeInsets.only(right: 5),
        child: Rotating(
          Icon(
            WeIcons.loading,
            color: theme['fontColor'],
            size: size['iconSize'],
          ),
        ),
      );
      children.insert(0, icon);
    }
    return Opacity(
      opacity: disable ? 0.7 : 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: widget.sizeType == WeButtonSize.mini
              ? MainAxisSize.min
              : MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 显示大小
    final size = widget.size;

    //是否禁用状态
    final disable = widget.disabled || widget.loading;

    //背景颜色
    final Color color = disable ? theme['disabledBackgroundColor'] : null;

    //圆角角度
    final radius = widget.radius ?? WeUI.getConfig(context).radius;

    //圆角
    final BorderRadius borderRadius = BorderRadius.all(Radius.circular(radius));

    //边框
    final Border border =
        widget.hollow || widget.theme == WeButtonType.acquiescent
            ? Border.all(
                width: size['borderSize'],
                color: theme['borderColor'],
              )
            : null;

    //按钮
    final Widget button = Container(
      height: size['height'],
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border,
      ),
      child: renderChild(widget.child),
    );

    if (disable) {
      return button;
    }

    return Material(
      borderRadius: borderRadius,
      color: theme['backgroundColor'],
      child: InkWell(
        onTap: onClick,
        borderRadius: borderRadius,
        child: button,
      ),
    );
  }

  ///点击事件
  void onClick() {
    if (widget.onClick is Function) {
      widget.onClick();
    }
  }
}
