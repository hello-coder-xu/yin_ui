import 'package:flutter/material.dart';
import 'package:flutter_ui/component/title.dart';
import 'package:ui/loadmore/index.dart';

class LoadMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          TitleView('Loadmore', '加载更多'),
          WeLoadMore(
            loading: true,
            loadingChild: '加载中...',
            moreChild: '没有更多',
          ),
          SizedBox(height: 10),
          WeLoadMore(
            loading: false,
            loadingChild: '加载中...',
            moreChild: '没有更多',
          ),
        ],
      ),
    );
  }
}
