import 'package:flutter/material.dart';
import 'package:ui/animation/rotating.dart';
import 'package:ui/icon/index.dart';
import 'package:ui/utils.dart';

//加载中
const Widget _loading = Text('loading...');

//加载中
const Widget _moreWidget = Text('加载更多');

//加载中
const Widget _divider =
    Expanded(child: Divider(height: 0.5, color: Color(0xffE5E5E5)));

//文字 padding
final double _textPadding = 12.0;

class WeLoadMore extends StatelessWidget {
  final bool loading;
  final dynamic loadingChild;
  final dynamic moreChild;

  WeLoadMore({
    this.loading = false,
    this.loadingChild = _loading,
    this.moreChild = _moreWidget,
  });

  @override
  Widget build(BuildContext context) {
    //加载中视图
    final Widget loadingWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Rotating(Icon(WeIcons.loading, size: 20)),
        ),
        DefaultTextStyle(
          style: TextStyle(fontSize: 16, color: Colors.black87),
          child: toTextWidget(loadingChild, 'load'),
        ),
      ],
    );

    //加载更多视图
    final Widget moreChildWidget = Row(
      children: <Widget>[
        _divider,
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: _textPadding, right: _textPadding),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff808080),
              ),
              child: toTextWidget(moreChild, 'more'),
            ),
          ),
        ),
        _divider,
      ],
    );

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: loading ? loadingWidget : moreChildWidget,
      ),
    );
  }
}
