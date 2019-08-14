//弹框类型
import 'package:flutter/material.dart';
import 'package:ui/dialog/service_widget.dart';
import 'package:ui/utils.dart';

import 'ios_widget.dart';
import 'android_widget.dart';

enum WeDialogTheme { ANDROID, IOS }

//弹框
typedef Alert = Function(
  dynamic message, {
  //标题
  dynamic title,
  //显示样式
  WeDialogTheme theme,
  //按钮
  dynamic button,
  //按钮事件
  Function onConfirm,
  //点击其他区域关闭对话框
  bool barrierDismissible,
});

//确认框
typedef Confirm = Function(
  dynamic message, {
  //标题
  dynamic title,
  //显示样式
  WeDialogTheme theme,
  //取消按钮
  dynamic cancelButton,
  //确定按钮
  dynamic confirmButton,
  //确定事件
  Function onConfirm,
  //取消事件
  Function onCancel,
  //点击其他区域关闭对话框
  bool barrierDismissible,
});

//服务条款阅读框
typedef Service = Function(
  dynamic message, {
  //标题
  dynamic title,
  //确定按钮
  dynamic confirmButton,
  //确定事件
  Function onConfirm,
  //持续时间
  int duration,
  // 倒计时显示
  dynamic otherButton,
});

_createAndroidLayout(
  BuildContext context,
  message, {
  //标题
  dynamic title,
  //弹框主题
  WeDialogTheme theme,
  //弹框类型
  String type,
  //取消按钮
  dynamic cancelButton,
  //确定按钮
  dynamic confirmButton,
  //取消事件
  Function onCancel,
  //确定事件
  Function onConfirm,
  // 对话框外操作可以关闭对话
  bool barrierDismissible = true,
  //持续时间
  int duration,
  // 倒计时显示文字
  dynamic otherButton,
}) {
  Function remove;

  final GlobalKey globalKey = GlobalKey();

  Widget widget;

  void close() async {
    if (theme == WeDialogTheme.ANDROID) {
      await (globalKey.currentState as AndroidWidgetState).reverseAnimation();
    } else if (theme == WeDialogTheme.IOS) {
      await (globalKey.currentState as IosWidgetState).reverseAnimation();
    } else {
      await (globalKey.currentState as ServiceWidgetState).reverseAnimation();
    }
    remove();
  }

  //确认
  void confirm() {
    if (onConfirm is Function) onConfirm();
    close();
  }

  //取消
  void cancel() {
    if (onCancel is Function) onCancel();
    close();
  }

  //蒙版点击与物理返回键
  void other() {
    if (!barrierDismissible) return;
    cancel();
  }

  final List<Map<String, Object>> buttons = [
    {
      "widget": toTextWidget(confirmButton, 'button'),
      'onClick': confirm,
    }
  ];

  if (type == 'confirm') {
    buttons.insert(0, {
      "widget": toTextWidget(cancelButton, 'button'),
      'onClick': cancel,
    });
  }

  switch (theme) {
    case WeDialogTheme.IOS:
      widget = IosWidget(
        key: globalKey,
        title: toTextWidget(title, 'title'),
        message: toTextWidget(message, 'message'),
        buttons: buttons,
        onMaskCLick: other,
      );
      break;
    case WeDialogTheme.ANDROID:
      widget = AndroidWidget(
        key: globalKey,
        title: toTextWidget(title, 'title'),
        message: toTextWidget(message, 'message'),
        buttons: buttons,
        onMaskCLick: other,
      );
      break;
    default:
      widget = ServiceWidget(
        key: globalKey,
        title: toTextWidget(title, 'title'),
        message: toTextWidget(message, 'message'),
        buttons: buttons,
        onMaskCLick: other,
        duration: duration,
        otherButton: otherButton,
      );
  }

  remove = createOverlayEntry(
    context: context,
    child: widget,
    willPopCallback: other,
  );
}

///对话框
class WeDialog {
  //提示框
  static Alert alert(BuildContext context) {
    return (
      message, {
      title = '提示',
      theme = WeDialogTheme.IOS,
      button = '确认',
      onConfirm,
      barrierDismissible,
    }) {
      _createAndroidLayout(
        context,
        message,
        title: title,
        theme: theme,
        type: 'alert',
        confirmButton: button,
        onConfirm: onConfirm,
        barrierDismissible: barrierDismissible,
      );
    };
  }

  //确认对话框
  static Confirm confirm(BuildContext context) {
    return (
      message, {
      title = '提示',
      theme = WeDialogTheme.IOS,
      cancelButton = '取消',
      onCancel,
      confirmButton = '确认',
      onConfirm,
      barrierDismissible,
    }) {
      _createAndroidLayout(
        context,
        message,
        title: title,
        theme: theme,
        type: 'confirm',
        confirmButton: confirmButton,
        onConfirm: onConfirm,
        cancelButton: cancelButton,
        onCancel: onCancel,
        barrierDismissible: barrierDismissible,
      );
    };
  }

  //服务条款阅读
  static Service service(BuildContext context) {
    return (
      message, {
      title = '提示',
      confirmButton = '确认',
      onConfirm,
      duration = 3,
      otherButton='后可关闭',
    }) {
      _createAndroidLayout(
        context,
        message,
        title: title,
        type: 'service',
        confirmButton: confirmButton,
        onConfirm: onConfirm,
        barrierDismissible: false,
        duration: duration,
        otherButton: otherButton,
      );
    };
  }
}
