//弹框类型
import 'package:flutter/material.dart';

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
});

_createAndroidLayout(
  BuildContext context,
  message, {
  dynamic title,
  WeDialogTheme theme,
  String type,
  dynamic cancelButton,
  dynamic confirmButton,
  Function onCancel,
  Function onConfirm,
}) {
  Function remove;

  final GlobalKey globalKey = GlobalKey();

  Widget widget;

  void close() async {
    if (theme == WeDialogTheme.ANDROID) {
    } else {}
  }
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
    }) {
      _createAndroidLayout(
        context,
        message,
        title: title,
        theme: theme,
        type: 'alert',
        confirmButton: button,
        onConfirm: onConfirm,
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
      );
    };
  }
}
