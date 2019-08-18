import 'package:flutter/material.dart';
import 'package:flutter_ui/views/badge.dart';
import 'package:flutter_ui/views/button.dart';

///路由
final routers = <String, WidgetBuilder>{
  '/button': (context) => Button(),
  '/badge': (context) => Badge(),
};
