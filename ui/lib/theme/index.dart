import 'package:flutter/material.dart';
import 'package:ui/toast/index.dart';

const Color _primaryColor = Color(0xff1AAD19);
const Color _primaryColorDisabled = Color(0xff9ED99D);
const Color _warnColor = Color(0xffE64340);
const Color _warnColorDisabled = Color(0xffEC8B89);
const Color _defaultBackgroundColor = Color(0xfff8f8f8);
const Color _defaultBorderColor = Color(0xffededed);
const Color _maskColor = Color.fromRGBO(17, 17, 17, 0.6);

final _defaultTheme = WeTheme();
final _defaultConfig = WeConfig();

///主题
class WeTheme {
  // 主色
  final Color primaryColor;

  // 主色禁用
  final Color primaryColorDisabled;

  // 警告色
  final Color warnColor;

  // 警告色禁用
  final Color warnColorDisabled;

  // 默认背景色
  final Color defaultBackgroundColor;

  // 默认边框色
  final Color defaultBorderColor;

  // 遮罩层颜色
  final Color maskColor;

  WeTheme({
    this.primaryColor = _primaryColor,
    this.primaryColorDisabled = _primaryColorDisabled,
    this.warnColor = _warnColor,
    this.warnColorDisabled = _warnColorDisabled,
    this.defaultBackgroundColor = _defaultBackgroundColor,
    this.defaultBorderColor = _defaultBorderColor,
    this.maskColor = _maskColor,
  });
}

///配置
class WeConfig {
  // toast 位置
  final WeToastInfoAlign toastInfoAlign;

  // toast info自动关闭时间
  final int toastInfoDuration;

  // toast loading关闭时间
  final int toastLoadingDuration;

  // toast success关闭时间
  final int toastSuccessDuration;

  // toast fail关闭时间
  final int toastFailDuration;

  // notify自动关闭时间
  final int notifyDuration;

  // notify成功关闭时间
  final int notifySuccessDuration;

  // notify错误关闭时间
  final int notifyErrorDuration;

  // 按钮圆角
  final double radius;

  WeConfig({
    this.toastInfoAlign = WeToastInfoAlign.center,
    this.toastInfoDuration = 2500,
    this.toastLoadingDuration,
    this.toastSuccessDuration = 2500,
    this.toastFailDuration = 2500,
    this.notifyDuration = 3000,
    this.notifySuccessDuration = 3000,
    this.notifyErrorDuration = 3000,
    this.radius = 4.0,
  });
}

class WeUI extends InheritedWidget {
  final WeTheme weTheme;
  final WeConfig weConfig;

  WeUI({
    key,
    Widget child,
    this.weTheme,
    this.weConfig,
  }) : super(key: key, child: child);

  static WeUI of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(WeUI);
  }

  ///获取主题
  static WeTheme getTheme(BuildContext context) {
    WeUI weUI = WeUI.of(context);
    return weUI == null || weUI.weTheme == null ? _defaultTheme : weUI.weTheme;
  }

  ///获取主题
  static WeConfig getConfig(BuildContext context) {
    WeUI weUI = WeUI.of(context);
    return weUI == null || weUI.weConfig == null
        ? _defaultConfig
        : weUI.weConfig;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
