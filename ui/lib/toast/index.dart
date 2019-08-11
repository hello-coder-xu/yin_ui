// 对齐方式
import 'package:flutter/material.dart';
import 'package:ui/animation/rotating.dart';
import 'package:ui/icon/index.dart';
import 'package:ui/theme/index.dart';
import 'package:ui/toast/info.dart';
import 'package:ui/toast/toast.dart';
import 'package:ui/utils.dart';

enum WeToastInfoAlign {
  // 上对齐
  top,
  // 居中
  center,
  // 下对齐
  bottom
}

// 加载图标
final Widget _loadingIcon = Image.asset('assets/images/loading.png',
    height: 42.0, package: 'ui', color: Colors.white);

// 成功图标
const Widget _successIcon = Icon(WeIcons.hook, color: Colors.white, size: 49.0);

// 失败图标
const Widget _failIcon = Icon(WeIcons.info, color: Colors.white, size: 49.0);

// 对齐方式
final List<String> _weToastAlign = ['top', 'center', 'bottom'];

// 信息
typedef _info = Function(dynamic message,
    {int duration, WeToastInfoAlign align, double distance});

// 加载中
typedef _loading = Function(
    {dynamic message, int duration, bool mask, Widget icon});

// 成功
typedef _success = Function(
    {dynamic message, int duration, bool mask, Widget icon, Function onClose});

// 失败
typedef _fail = Function(
    {dynamic message, int duration, bool mask, Widget icon, Function onClose});

// 提示
typedef _toast = Function(
    {dynamic message, int duration, bool mask, Widget icon, Function onClose});

// 加载关闭
typedef _close = Function();

class WeToast {
  //信息显示
  static _info info(BuildContext context) {
    return (message, {duration, align, distance = 100.0}) async {
      //获取全局配置
      final WeConfig weConfig = WeUI.getConfig(context);

      //获得显示内容
      final Widget messageWidget = toTextWidget(message, 'message');

      //创建悬浮并显示
      final remove = createOverlayEntry(
        context: context,
        child: InfoWidget(
          messageWidget,
          align: _weToastAlign[
              align == null ? weConfig.toastInfoAlign.index : align.index],
          distance: distance,
        ),
      );

      //延时
      await Future.delayed(
          Duration(milliseconds: duration ?? weConfig.toastInfoDuration));

      //关闭
      remove();
    };
  }

  //加载中
  static _loading loading(BuildContext context) {
    _close show({message, duration, mask = true, icon}) {
      WeConfig weConfig = WeUI.getConfig(context);

      return WeToast.toast(context)(
        icon: Rotating(icon ?? _loadingIcon, duration: 800, clockwise: false),
        mask: mask,
        message: message,
        duration: duration ?? weConfig.toastLoadingDuration,
      );
    }

    return show;
  }

  // 成功
  static _success success(BuildContext context) {
    return ({message, duration, mask = true, icon = _successIcon, onClose}) {
      final int toastSuccessDuration =
          WeUI.getConfig(context).toastSuccessDuration;
      WeToast.toast(context)(
          icon: icon,
          mask: mask,
          message: message,
          duration: duration == null ? toastSuccessDuration : duration,
          onClose: onClose);
    };
  }

  // 失败
  static _fail fail(BuildContext context) {
    return ({message, duration, mask = true, icon = _failIcon, onClose}) {
      final int toastFailDuration = WeUI.getConfig(context).toastFailDuration;
      WeToast.toast(context)(
          icon: icon,
          mask: mask,
          message: message,
          duration: duration == null ? toastFailDuration : duration,
          onClose: onClose);
    };
  }

  //提示
  static _toast toast(BuildContext context) {
    return ({message, duration, mask = true, icon, onClose}) {
      final Widget messageWidget = toTextWidget(message, 'message');

      //创建悬浮并显示
      Function remove = createOverlayEntry(
        context: context,
        child: ToastWidget(
          message: messageWidget,
          mask: mask,
          icon: icon,
        ),
      );

      //关闭事件
      void close() {
        if (remove != null) {
          remove();
          remove = null;
        }
      }

      //延时处理
      if (duration != null) {
        Future.delayed(Duration(milliseconds: duration), () {
          close();
          //执行回调
          if (onClose is Function) onClose();
        });
      }
      return close;
    };
  }
}
