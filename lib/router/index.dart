import 'package:flutter/material.dart';
import 'package:flutter_ui/views/badge.dart';
import 'package:flutter_ui/views/button.dart';
import 'package:flutter_ui/views/loadmore.dart';
import 'package:flutter_ui/views/radio.dart';

///路由
final routers = <String, WidgetBuilder>{
  '/button': (context) => Button(),
  '/badge': (context) => Badge(),
  '/loadmore': (context) => LoadMore(),
  '/radio': (context) => RadioPage(),
};
